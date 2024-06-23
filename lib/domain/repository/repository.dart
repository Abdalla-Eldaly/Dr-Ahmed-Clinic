import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, bool>> getAppStatus();



}
