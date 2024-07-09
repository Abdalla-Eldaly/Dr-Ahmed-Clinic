import 'package:uuid/uuid.dart';

class LoginRequest{
  String email;
  String password;

  LoginRequest(this.email, this.password);
}



class PatientRequest {
  final String uid;
  final String name;
  final String age;
  final String phone;
  final String gender;
  final String address;
  final String services;

  PatientRequest({
    String? uid,
    required this.name,
    required this.age,
    required this.phone,
    required this.gender,
    required this.address,
    required this.services,
  }) : uid = uid ?? const Uuid().v4();
}
class DoctorRequest{
  String id;
  String name;
  String email;
  String password;

  DoctorRequest(this.id, this.name, this.email,this.password);
}

class NurseRequest{
  String id;
  String name;
  String email;
  String password;

  NurseRequest(this.id, this.name, this.email,this.password);
}