import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/models/domain.dart';
import '../../../domain/models/enums.dart';
import '../../../domain/models/model.dart';

class DataIntent {
  DataIntent._();


  static UserRole? _userRole;
  static UserModel? _user;

  static void setUserRole(UserRole role) => _userRole = role;

  static UserRole? getUserRole() {
    return _userRole;
  }


  static void pushUser(UserModel user) {
    _user = user;
  }

  static User? _fireAuthUser;

  static UserModel getUser() {
    return _user!;
  }

  static User? getFireAuthUser() {
    return _fireAuthUser;
  }

  static void deleteFireAuthUser() {
    _fireAuthUser = null;
  }


  static void pushFireAuthUser(User? fireAuthUser) {
    _fireAuthUser = fireAuthUser;
  }




  static UserType _selection = UserType.none;

  static void setSelection(UserType item) => _selection = item;

  static UserType getSelection() {
    return _selection;
  }

}





class UserManager {
  DoctorModel? _currentDoctor;

  NurseModel? _currentNurse;

  UserType? _currentUserType;

  DoctorModel? get getCurrentDoctor => _currentDoctor;

  NurseModel? get getCurrentNurse => _currentNurse;

  UserType? get getCurrentUserType => _currentUserType;

  void setCurrentDoctor(DoctorModel doctorModel)  {
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

