import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/failure.dart';
import 'package:zag_nights/domain/models/model.dart';

import '../../data/network/requests.dart';

abstract class Repository {
Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);


}
