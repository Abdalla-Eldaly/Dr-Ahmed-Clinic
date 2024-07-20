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

class PatientModel {
  final String id;
  final String address;
  final String name;
  final String phone;
  final String services;
  final String age;
  final String gender;
  final DateTime create_At;

  PatientModel({
    required this.id,
    required this.address,
    required this.name,
    required this.phone,
    required this.services,
    required this.age,
    required this.gender,
    required this.create_At,
  });

  factory PatientModel.fake() => PatientModel(
        id: '',
        create_At: DateTime(2024),
        address: '',
        name: '',
        phone: '',
        services: '',
        age: '',
        gender: '',
      );

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'] ?? '',
      address: map['address'],
      name: map['name'],
      phone: map['phone'],
      services: map['services'],
      age: map['age'],
      gender: map['gender'],
      create_At: map['create_At'].toDate(),
    );
  }
}
