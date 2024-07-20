import 'package:zag_nights/presentation/base/base_states.dart';

class LogoutState extends BaseStates{}
class PatientDataSuccessState extends BaseStates{}
class PatientDataCounterState extends BaseStates{
  int counter  = 0 ;

  PatientDataCounterState(this.counter);
}