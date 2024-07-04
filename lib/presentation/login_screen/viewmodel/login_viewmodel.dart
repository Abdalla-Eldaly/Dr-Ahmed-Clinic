import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zag_nights/domain/usecase/login_usecase.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/base/base_states.dart';

import '../../../data/network/error_handler.dart';
import '../../../domain/models/enums.dart';
import '../../../domain/usecase/resetPassword_usecase.dart';
import '../../../domain/usecase/sign_in_with_google_usecase.dart';
import '../../common/data_intent/data_intent.dart';
import '../states/login_states.dart';

class LoginViewModel extends BaseCubit
    implements LoginViewModelInput, LoginViewModelOutput {
  static LoginViewModel get(BuildContext context) =>
      BlocProvider.of<LoginViewModel>(context);

  final LoginUseCase _loginUseCase;
  final SignWithGoogleUseCase _signWithGoogleUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final UserManager _userManager;

  LoginViewModel(this._loginUseCase, this._resetPasswordUseCase, this._signWithGoogleUseCase, this._userManager);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void start() {

  }

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getPasswordController => _passwordController;

  Future<void> login() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    (await _loginUseCase(
            LoginUseCaseInput(_emailController.text, _passwordController.text)))
        .fold((l) {
      emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
    }, (r) { emit(SuccessState('Login Successfully'));

    if (_userManager.getCurrentUserType == UserType.doctor) {
      emit(DoctorLoginState());
    } else {
      emit(NurseLoginState());
    }

        });
  }


  Future<void> resetPassword() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    (await _resetPasswordUseCase(
        ResetPasswordUseCaseInput(_emailController.text)))
        .fold((l) {
      emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
    }, (r) => emit(ResetPasswordState()));
  }


  Future<void> signInWithGoogle() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    await _signWithGoogleUseCase(null).then(
          (value) {
        value.fold(
              (l) {
            if (l.code == DataSource.MISSING_DATA.getFailure().code) {
              emit(SocialLoginState());
            } else {
              emit(
                ErrorState(
                  failure: l,
                  displayType: DisplayType.popUpDialog,
                ),
              );
            }
          },
              (r) {
            emit(SuccessState('Login Successfully'));
          },
        );
      },
    );
  }

}

abstract class LoginViewModelInput {}

abstract class LoginViewModelOutput {
  TextEditingController get getEmailController;
  TextEditingController get getPasswordController;
}
