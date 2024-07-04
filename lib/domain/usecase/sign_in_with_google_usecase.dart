import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SignWithGoogleUseCase extends BaseUsecase<void, void> {
  final Repository _repository;

  SignWithGoogleUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(void input) async {
    return _repository.signInWithGoogle();
  }
}
