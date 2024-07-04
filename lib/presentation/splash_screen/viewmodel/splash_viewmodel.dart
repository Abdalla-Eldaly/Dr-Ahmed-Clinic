import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/enums.dart';
import '../../../domain/usecase/get_signeduser_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../../common/data_intent/data_intent.dart';
import '../states/splash_states.dart';

class SplashViewModel extends BaseCubit
    implements SplashViewModelInput, SplashViewModelOutput {
  static SplashViewModel get(context) => BlocProvider.of(context);

  final GetSignedUserUseCase _signedUserUseCase;
  final UserManager _userManager;

  SplashViewModel(this._signedUserUseCase, this._userManager);

  @override
  void start() async {
    await _signedUserUseCase(null).then(
          (value) {
        value.fold(
              (l) {
            emit(ErrorState(failure: l));
          },
              (r) async {
            if (r == null) {
              emit(UserNotSignedState());
            } else {
              if (_userManager.getCurrentUserType == UserType.doctor) {
                emit(DoctorState());
              } else {
                emit(NurseState());
              }
            }
          },
        );
      },
    );
  }

}

abstract class SplashViewModelInput {}

abstract class SplashViewModelOutput {}
