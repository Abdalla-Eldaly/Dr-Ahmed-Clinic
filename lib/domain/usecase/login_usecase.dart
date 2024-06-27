import 'package:dartz/dartz.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/domain/repository/repository.dart';
import 'package:zag_nights/domain/usecase/base_usecase.dart';

class LoginUseCase extends BaseUsecase<LoginUseCaseInput, void> {
  final Repository _repository;

  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(LoginUseCaseInput input) {
    return _repository.login(email: input.email, password: input.password);
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput(this.email, this.password);
}
