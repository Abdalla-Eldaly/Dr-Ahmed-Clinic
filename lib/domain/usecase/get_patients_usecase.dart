import 'package:dartz/dartz.dart';
import 'package:zag_nights/domain/models/model.dart';
import 'package:zag_nights/domain/repository/repository.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'base_usecase.dart';

class GetAllPatientUseCase
    extends BaseUsecase<GetAllPatientUseCaseInput, Stream<List<PatientModel>>> {
  final Repository _repository;

  GetAllPatientUseCase(this._repository);

  @override
  Future<Either<Failure, Stream<List<PatientModel>>>> call(
      GetAllPatientUseCaseInput input) async {
    return _repository.getAllPatient(date: input.date);
  }
}

class GetAllPatientUseCaseInput {
  final DateTime date;

  GetAllPatientUseCaseInput({required this.date});
}
