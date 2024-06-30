import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/models/enums.dart';

import '../../../domain/usecase/get_signeduser_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../../common/data_intent/data_intent.dart';
import '../states/splash_states.dart';

class SplashViewModel extends BaseCubit
    implements SplashViewModelInput, SplashViewModelOutput {
  static SplashViewModel get(context) => BlocProvider.of(context);

  final GetSignedUserUseCase _signedUserUseCase;

  SplashViewModel(this._signedUserUseCase);

  @override
  void start() async {
    await _signedUserUseCase(null).then(
          (value) {
        value.fold(
              (l) {
            ErrorState(failure: l);
          },
              (r) async {
            if (r == null) {
              emit(UserNotSignedState());
            } else {
              if (DataIntent.getUserRole() == UserRole.doctor) {
                emit(DoctorSignedState());
              } else {
                emit(NurserSignedState());
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
