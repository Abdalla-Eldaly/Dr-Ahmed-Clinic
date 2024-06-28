import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/models/domain.dart';
import '../../../domain/models/enums.dart';

class DataIntent {
  DataIntent._();


  static UserRole? _userRole;

  static void setUserRole(UserRole role) => _userRole = role;

  static UserRole? getUserRole() {
    return _userRole;
  }


  static User? _fireAuthUser;

  static User? getFireAuthUser() {
    return _fireAuthUser;
  }

  static void deleteFireAuthUser() {
    _fireAuthUser = null;
  }
}
