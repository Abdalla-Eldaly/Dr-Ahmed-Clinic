import 'package:dartz/dartz.dart';
import 'package:zag_nights/data/network/failure.dart';

abstract class BaseUsecase <INPUT,OUTPUT> {
  Future <Either<Failure,OUTPUT>> call(INPUT input);
}