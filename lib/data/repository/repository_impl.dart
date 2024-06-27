import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/mappers/mappers.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/domain/models/model.dart';

import '../../domain/repository/repository.dart';
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
        await _remoteDataSource.login(email: email, password: password);
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

}
