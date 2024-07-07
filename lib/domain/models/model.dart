import 'enums.dart';

class UserModel {
  final String? uid;
  final String? username;
  final String? email;
  final UserType userType;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.userType,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserType userType;
    if (map['user_type'].toLowerCase() == 'doctor') {
      userType = UserType.doctor;
    } else {
      userType = UserType.nurse;
    }

    return UserModel(
      uid: map['id'],
      username: map['username'],
      email: map['email'],
      userType: userType,
    );
  }
}

class DoctorModel {
  final String uid;
  final String username;
  final String email;
  final UserType userType;

  DoctorModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.userType,
  });

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      uid: map['id'],
      username: map['user_name'],
      email: map['email'],
      userType: UserType.doctor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'user_name': username,
      'email': email,
      'user_type': UserType.doctor,
    };
  }
}

class NurseModel {
  final String uid;
  final String username;
  final String email;
  final UserType userType;

  NurseModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.userType,
  });

  factory NurseModel.fromMap(Map<String, dynamic> map) {
    return NurseModel(
      uid: map['id'],
      username: map['user_name'],
      email: map['email'],
      userType: UserType.nurse,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'user_name': username,
      'email': email,
      'user_type': UserType.nurse,
    };
  }
}
