import 'enums.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final UserRole userRole;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.userRole,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserRole userRole;
    if (map['user_type'].toLowerCase() == 'doctor') {
      userRole = UserRole.doctor;
    } else {
      userRole = UserRole.nurse;
    }

    return UserModel(
      uid: map['id'],
      username: map['username'],
      email: map['email'],
      userRole: userRole,
    );
  }




}
