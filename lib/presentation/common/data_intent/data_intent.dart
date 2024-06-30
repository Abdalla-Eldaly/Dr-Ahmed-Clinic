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
}
