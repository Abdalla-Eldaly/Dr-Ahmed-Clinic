import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:zag_nights/data/mappers/mappers.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/domain/models/model.dart';

import '../../domain/models/enums.dart';
import '../../domain/repository/repository.dart';
import '../../presentation/common/data_intent/data_intent.dart';
import '../data_source/cache_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  // final LocalDataSource _localDataSource;
  final CacheDataSource _cacheDataSource;
  final NetworkInfo _networkInfo;
  final Uuid _uuidGenerator = const Uuid();

  // final GSheetFactory _gSheetFactory;
  // final DateNTP _dateNTP;

  RepositoryImpl(
    this._remoteDataSource,
    // this._localDataSource,
    this._networkInfo,
    this._cacheDataSource,
    // this._gSheetFactory,
    // this._dateNTP,
  );

  @override
  Future<Either<Failure, void>> login(
      {required String email, required String password}) async {
    try {
      if (await _networkInfo.isConnected) {
        void response;
        await _remoteDataSource.login(loginRequest: LoginRequest(email, password));
        return Right(response);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } on FirebaseAuthException {
      return Left(DataSource.LOGIN_FAILED.getFailure());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String username,
    required String email,
    required String? password,

    required UserRole userType,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        String uuid = _uuidGenerator.v1();
        if (userType == UserRole.doctor) {
          await _remoteDataSource.saveDoctorToDataBase(id: uuid, name: username, email: email, password: password);
        } else {
          await _remoteDataSource.saveNurseToDataBase(id: uuid, name: username, email: email, password: password);

        }
        await fetchCurrentUser(email);
        return const Right(null);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }






  Future<Either<Failure, User?>> fetchCurrentUser([String? email]) async {
    try {
      if (await _networkInfo.isConnected) {
        var data = _cacheDataSource.getSignedUser();
        print(1);
        print(data);
        if (data != null) {
          Map<String, dynamic>? userData = await _remoteDataSource.getUserData(
            email: data.email!,
          );
          UserModel userModel = UserModel.fromMap(userData!);
          DataIntent.pushUser(userModel);
          if (userData['user_type'].toLowerCase() == 'doctor') {
            DataIntent.setUserRole(UserRole.doctor);
          } else {
            DataIntent.setUserRole(UserRole.nurse);
          }
        }
        return Right(data);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }


}
