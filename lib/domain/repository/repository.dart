import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/data/network/requests.dart';
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

Future<Either<Failure, User?>> fetchCurrentUser();

Future<Either<Failure, User?>> signInWithGoogle();

Future<Either<Failure,void>> addPatient(PatientRequest patientRequest);


Future<Either<Failure, void>> logout();

}