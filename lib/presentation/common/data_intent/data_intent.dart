import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/models/enums.dart';
import '../../../domain/models/model.dart';
class DataIntent {
  DataIntent._();

  static UserRole? _userRole;
  static UserModel? _user;
  static User? _fireAuthUser;
  static UserType _selection = UserType.none;
  static Stream<List<PatientModel>>? _patientsStream;
  static DateTime? _patientDepartureDate;
  static DateTime? _busDepartureDate;

  static void setUserRole(UserRole role) => _userRole = role;

  static UserRole? getUserRole() => _userRole;

  static void pushUser(UserModel user) => _user = user;

  static UserModel getUser() => _user!;

  static User? getFireAuthUser() => _fireAuthUser;

  static void deleteFireAuthUser() => _fireAuthUser = null;

  static void pushFireAuthUser(User? fireAuthUser) => _fireAuthUser = fireAuthUser;

  static void setSelection(UserType item) => _selection = item;

  static UserType getSelection() => _selection;

  static void pushPatientsStream(Stream<List<PatientModel>> patientStream) {
    _patientsStream = patientStream;
  }

  static Stream<List<PatientModel>>? getPatientsStream() => _patientsStream;

  static Stream<List<PatientModel>> popPatientsStream() {
    if (_patientsStream == null) {
      throw StateError("Patients stream has not been initialized.");
    }
    Stream<List<PatientModel>> value = _patientsStream!;
    _patientsStream = null;
    return value;
  }

  static void setPatientDate(DateTime patientDate) {
    _patientDepartureDate = patientDate;
  }

  static DateTime getPatientDate() {
    if (_patientDepartureDate == null) {
      throw StateError("Patient departure date has not been set.");
    }
    return _patientDepartureDate!;
  }
}


class UserManager {
  DoctorModel? _currentDoctor;
  NurseModel? _currentNurse;
  UserType? _currentUserType;

  DoctorModel? get getCurrentDoctor => _currentDoctor;
  NurseModel? get getCurrentNurse => _currentNurse;
  UserType? get getCurrentUserType => _currentUserType;

  void setCurrentDoctor(DoctorModel doctorModel) {
    _currentDoctor = doctorModel;
    _currentUserType = UserType.doctor;
    _currentNurse = null;
  }

  void setCurrentNurse(NurseModel nurseModel) {
    _currentNurse = nurseModel;
    _currentUserType = UserType.nurse;
    _currentDoctor = null;
  }
}


