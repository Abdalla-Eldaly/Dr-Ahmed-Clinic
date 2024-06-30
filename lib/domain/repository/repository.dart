import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/domain/models/model.dart';

import '../../data/network/requests.dart';
import '../models/enums.dart';

abstract class Repository {
Future<Either<Failure,void>> login({required String email , required String password});
Future<Either<Failure,void>> passwordReset({required String email});

Future<Either<Failure, void>> register({
  required String username,
  required String email,
  required String? password,
  required UserRole userType,
});


}
