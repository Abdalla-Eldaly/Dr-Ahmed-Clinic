import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_pref.dart';
import '../../app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

     int _timeOut = 1;
    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(seconds:Constants.timeOut ),
      sendTimeout: const Duration(seconds:Constants.timeOut ),
    );
    // dio.options = BaseOptions(
    //     baseUrl: Constants.baseUrl,
    //     headers: headers,
    //     responseType: ResponseType.bytes,
    //     receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
    //     sendTimeout: const Duration(
    //       milliseconds: Constants.apiTimeOut,
    //     ));
    //
    // if (!kReleaseMode) {
    //   // its debug mode so print app logs
    //   dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //   ));
    // }
    //

    if(!kDebugMode) {

      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,

      ));
    }
    return dio;
  }
}
