// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/resources/strings_manager.dart';
import 'failure.dart';

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  EMAIL_ALREADY_EXISTS,
  LOGIN_FAILED,
  MISSING_DATA,

  DEFAULT, CONNECTION_ERROR, BAD_CERTIFICATE
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int MISSING_DATA = -16;

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int EMAIL_ALREADY_EXISTS = -7;
  static const int LOGIN_FAILED = -8;
  static const int CONNECTION_ERROR = -11;
  static const int DEFAULT = -10;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side
  static const String MISSING_DATA = AppStrings.missingDataError;

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String EMAIL_ALREADY_EXISTS = AppStrings.emailAlreadyExists;
  static const String LOGIN_FAILED = AppStrings.loginFailed;

  static const String CONNECTION_ERROR = "Connection Error";
  static const String DEFAULT = AppStrings.defaultError;
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.MISSING_DATA:
        return Failure(
          ResponseCode.MISSING_DATA,
          ResponseMessage.MISSING_DATA,
        );
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.EMAIL_ALREADY_EXISTS:
        return Failure(ResponseCode.EMAIL_ALREADY_EXISTS,
            ResponseMessage.EMAIL_ALREADY_EXISTS);
      case DataSource.LOGIN_FAILED:
        return Failure(ResponseCode.LOGIN_FAILED,
            ResponseMessage.LOGIN_FAILED);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      case DataSource.CONNECTION_ERROR:
        return Failure(ResponseCode.CONNECTION_ERROR, ResponseMessage.CONNECTION_ERROR);
      case DataSource.BAD_CERTIFICATE:
        return Failure(ResponseCode.CONNECTION_ERROR, ResponseMessage.CONNECTION_ERROR);
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    // if (error is DioError) {
    //   // dio error so its an error from response of the API or from dio itself
    //   failure = _handleError(error);
    // } else {
    //   // default error
    //   failure = DataSource.DEFAULT.getFailure();
    // }
    if (kDebugMode) {
      print("\n\nERROR HAS HAPPENED");
      print("$error");
      print("\n\n");
    }

    if (error is Failure) {
      failure = error;
    } else if (error is DataSource) {
      failure = error.getFailure();
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

Failure _handleError(DioError error) {
switch (error.type) {
// case DioErrorType.connectTimeout:
//   return DataSource.CONNECT_TIMEOUT.getFailure();
  case DioErrorType.sendTimeout:
    return DataSource.SEND_TIMEOUT.getFailure();
  case DioErrorType.receiveTimeout:
    return DataSource.RECIEVE_TIMEOUT.getFailure();
  // case DioErrorType.response:
  //   if (error.response != null &&
  //       error.response?.statusCode != null &&
  //       error.response?.statusMessage != null) {
  //     return Failure(error.response?.statusCode ?? 0,
  //         error.response?.statusMessage ?? "");
  //   } else {
  //     return DataSource.DEFAULT.getFailure();
  //   }
  case DioErrorType.cancel:
    return DataSource.CANCEL.getFailure();
  // case DioErrorType.other:
  //   return DataSource.DEFAULT.getFailure();
  case DioExceptionType.connectionTimeout:
    return DataSource.CONNECT_TIMEOUT.getFailure();

  case DioExceptionType.badCertificate:
    return DataSource.BAD_CERTIFICATE.getFailure();
  case DioExceptionType.badResponse:
    return DataSource.BAD_REQUEST.getFailure();
  case DioExceptionType.connectionError:
    return DataSource.CONNECTION_ERROR.getFailure();
  case DioExceptionType.unknown:
    return DataSource.DEFAULT.getFailure();
}
  return DataSource.DEFAULT.getFailure();
}
}
class AppInternalState {
  static const int SUCCESS = 0;
  static const int ERROR = 1;
}