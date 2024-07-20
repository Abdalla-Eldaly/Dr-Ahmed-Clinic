

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/models/model.dart';
import '../../../../../base/base_cubit.dart';
import '../../../../../base/base_states.dart';
import '../../../../../common/data_intent/data_intent.dart';

class PatientViewModel extends BaseCubit
    implements PatientViewModelInput, PatientViewModelOutput {
  static PatientViewModel get(context) => BlocProvider.of(context);

  late final Stream<List<PatientModel>> _patientsStream;
  late final DateTime _dateTime;

  @override
  void start() {
    _fetchData();
  }

  _fetchData() {
    emit(LoadingState());
    _patientsStream = DataIntent.popPatientsStream()!;
    _dateTime = DataIntent.getPatientDate();
    emit(ContentState());
  }

  @override
  Stream<List<PatientModel>> get getPatientStream => _patientsStream;

  @override
  DateTime get getDepartureDate => _dateTime;
}

abstract class PatientViewModelInput {}

abstract class PatientViewModelOutput {
  Stream<List<PatientModel>> get getPatientStream;
  DateTime get getDepartureDate;
}
