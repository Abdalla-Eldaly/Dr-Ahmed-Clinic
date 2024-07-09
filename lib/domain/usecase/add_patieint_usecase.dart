import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/requests.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AddPatientUseCase extends BaseUsecase<AddPatientUseCaseInput, void> {
  final Repository _repository;

  AddPatientUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddPatientUseCaseInput input) {
    return _repository.addPatient(PatientRequest(
        name: input.name,
        age: input.age,
        phone: input.phone,
        gender: input.gender,
        address: input.address,
        services: input.services));
  }
}

class AddPatientUseCaseInput {
  final String name;
  final String age;
  final String phone;
  final String gender;
  final String address;
  final String services;

  AddPatientUseCaseInput( this.name, this.age, this.phone, this.gender,
      this.address, this.services);
}
