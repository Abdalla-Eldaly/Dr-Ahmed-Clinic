import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/login_usecase.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/base/base_states.dart';

class LoginViewModel extends BaseCubit
    implements LoginViewModelInput, LoginViewModelOutput {
  static LoginViewModel get(BuildContext context) =>
      BlocProvider.of<LoginViewModel>(context);

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void start() {}

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
    }, (r) => emit(SuccessState('Login Successfully')));
  }
}

abstract class LoginViewModelInput {}

abstract class LoginViewModelOutput {
  TextEditingController get getEmailController;
  TextEditingController get getPasswordController;
}
