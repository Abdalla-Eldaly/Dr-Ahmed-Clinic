import 'package:dartz/dartz.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/domain/repository/repository.dart';
import 'package:zag_nights/domain/usecase/base_usecase.dart';

class ResetPasswordUseCase extends BaseUsecase<ResetPasswordUseCaseInput, void> {
  final Repository _repository;

  ResetPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(ResetPasswordUseCaseInput input) {
    return _repository.passwordReset(email: input.email,);
  }
}

class ResetPasswordUseCaseInput {
  final String email;

  ResetPasswordUseCaseInput(this.email);
}
