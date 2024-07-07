import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/states/nurse_states.dart';

import '../../../domain/usecase/logout_usecase.dart';
import '../../base/base_states.dart';
import 'package:flutter/material.dart';

class NurseViewModel extends BaseCubit
    implements NurseViewModelInput, NurseViewModelOutput {
  final LogoutUseCase _logoutUseCase;
  static NurseViewModel get(BuildContext context) =>
      BlocProvider.of<NurseViewModel>(context);
  NurseViewModel(this._logoutUseCase);

  @override
  void start() {}

  Future<void> logout() async {
    emit(LoadingState());
    await _logoutUseCase.call(null).then((value) {
      value.fold((l) {
        emit(
          ErrorState(
            failure: l,
            displayType: DisplayType.popUpDialog,
          ),
        );
      }, (r) {
        emit(LogoutState());
      });
    });
  }
}

abstract class NurseViewModelInput {}

abstract class NurseViewModelOutput {}
