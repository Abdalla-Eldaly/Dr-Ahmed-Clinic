import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/states/nurse_states.dart';

import '../../../domain/models/model.dart';
import '../../../domain/usecase/get_patients_usecase.dart';
import '../../../domain/usecase/logout_usecase.dart';
import '../../base/base_states.dart';
import '../../common/data_intent/data_intent.dart';

class NurseViewModel extends BaseCubit
    implements NurseViewModelInput, NurseViewModelOutput {
  final LogoutUseCase _logoutUseCase;
  final GetAllPatientUseCase _getAllPatientsUseCase;
  DateTime? _selectedDate;

  static NurseViewModel get(BuildContext context) =>
      BlocProvider.of<NurseViewModel>(context);

  NurseViewModel(this._logoutUseCase, this._getAllPatientsUseCase) {
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  final TextEditingController _dateController = TextEditingController();

  @override
  void start() {
    getPatientCount();
  }

  Future<void> getPatients() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));

    await _getAllPatientsUseCase(
      GetAllPatientUseCaseInput(date:_selectedDate ??DateTime.now()),
    ).then((value) {
      value.fold(
        (failure) {
          emit(ErrorState(
              failure: failure, displayType: DisplayType.popUpDialog));
        },
        (r) {
// emit(ContentState());
          DataIntent.pushPatientsStream(r);
          DataIntent.setPatientDate(_selectedDate ?? DateTime.now());
          emit(PatientDataSuccessState());
        },
      );
    });
  }


  Future<void> getPatientCount() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));

    await _getAllPatientsUseCase(
      GetAllPatientUseCaseInput(date: _selectedDate ?? DateTime.now()),
    ).then((value) {
      value.fold(
            (failure) {
          emit(ErrorState(
              failure: failure, displayType: DisplayType.popUpDialog));
        },
            (patientsStream) async {
          patientsStream.listen((patients) {
            emit(PatientDataCounterState(patients.length));

            DataIntent.setPatientCount(patients.length);
          }).onError((failure) {
            emit(ErrorState(
                failure: failure, displayType: DisplayType.popUpDialog));
          });
        },
      );
    });
  }

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

  DateTime? get getDate => _selectedDate;

  @override
  TextEditingController get getDateController => _dateController;

  @override
  set setDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    _selectedDate = date;
    _dateController.text = formatter.format(_selectedDate!);
  }
}

abstract class NurseViewModelInput {
  set setDate(DateTime date);
}

abstract class NurseViewModelOutput {
  TextEditingController get getDateController;
}
