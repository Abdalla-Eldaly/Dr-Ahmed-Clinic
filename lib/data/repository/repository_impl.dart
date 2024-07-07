import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  final UserManager _userManager;
  // final GSheetFactory _gSheetFactory;
  // final DateNTP _dateNTP;

  RepositoryImpl(
    this._remoteDataSource,
    // this._localDataSource,
    this._networkInfo,
    this._cacheDataSource, this._userManager,
    // this._gSheetFactory,
    // this._dateNTP,
  );

  @override
  Future<Either<Failure, void>> login(
      {required String email, required String password}) async {
    try {
      if (await _networkInfo.isConnected) {
        void response;
        await _remoteDataSource.login(
            loginRequest: LoginRequest(email, password));
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
          await _remoteDataSource.saveDoctorToDataBase(
              id: uuid, name: username, email: email, password: password);
        } else {
          await _remoteDataSource.saveNurseToDataBase(
              id: uuid, name: username, email: email, password: password);
        }
        await fetchCurrentUser();
        return const Right(null);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, User?>> fetchCurrentUser() async {
    try {
      if (await _networkInfo.isConnected) {
        User? data = _cacheDataSource.getSignedUser();
        if (data != null) {
          Map<String, dynamic>? userData = await _remoteDataSource.getUserData(
            email: data.email!,
          );
          userData?['created_at'] = userData['created_at'].toString();
          if (userData?['user_type'] == 'doctor') {
            _userManager.setCurrentDoctor(DoctorModel.fromMap(userData!));
          } else {
            _userManager.setCurrentNurse(NurseModel.fromMap(userData!));
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
  @override
  Future<Either<Failure, void>> passwordReset({
    required String email,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        void response;
        await _remoteDataSource.resetPassword(
          email: email,
        );
        fetchCurrentUser();
        return Right(response);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } on FirebaseAuthException {
      return Left(DataSource.LOGIN_FAILED.getFailure());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }


  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _cacheDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }


  @override
  Future<Either<Failure, User?>> signInWithGoogle() async {
    try {
      if (await _networkInfo.isConnected) {
        GoogleSignInAccount? googleAccount =
        await _remoteDataSource.selectGoogleAccount();
        bool userExists = (await _remoteDataSource.doesUserExists(
            email: googleAccount!.email)) ==
            RegisteredBeforeError.emailUsed;
        User? user = await _remoteDataSource.signInWithGoogle(googleAccount);
        if (!userExists) {
          DataIntent.pushFireAuthUser(user);
          return Left(DataSource.MISSING_DATA.getFailure());
        } else {
          await fetchCurrentUser();
          return Right(user);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }}
