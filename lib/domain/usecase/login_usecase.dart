import 'package:dartz/dartz.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/domain/models/model.dart';
import 'package:zag_nights/domain/repository/repository.dart';
import 'package:zag_nights/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';

abstract class LoginUseCase  implements BaseUsecase<LoginUseCaseInput, Authentication>{
Repository _repository;

 LoginUseCase(this._repository);

   Future<Either<Failure, Authentication>> call(LoginUseCaseInput input)async{
     return await _repository.login(LoginRequest(input.email, input.password));
   }
}

class LoginUseCaseInput{
 final String email;
 final String password;

  LoginUseCaseInput({required this.email, required this.password});
}