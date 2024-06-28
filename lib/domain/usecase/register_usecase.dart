import 'package:dartz/dartz.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/domain/repository/repository.dart';
import 'package:zag_nights/domain/usecase/base_usecase.dart';

import '../models/enums.dart';

class RegisteruseCase extends BaseUsecase<RegisterUsecaseInput, void> {
  final Repository _repository;

  RegisteruseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(RegisterUsecaseInput input) {
    return _repository.register(
        username: input.username,
        email: input.email,
        password: input.password,
        userType: input.userType);
  }
}

class RegisterUsecaseInput {
  final String username;
  final String email;
  final String? password;

  final UserRole userType;

  RegisterUsecaseInput(
      {required this.username,
      required this.email,
      required this.userType,
      this.password});
}
