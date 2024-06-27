import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:zag_nights/app/constants.dart';

import '../response/responses.dart';
part 'api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppServicesClient;

  @POST('/customeres/login')
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);
}

class AppServiceClientImpl implements AppServicesClient {
  final Dio _dio;

  AppServiceClientImpl(this._dio);

  @override
  Future<AuthenticationResponse> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

// @override
// Future<NewsListResponse> getNews() async {
//   Response response = await _dio.post(
//     _newsEndPoint,
//   );
//
//   var data = const Utf8Codec().decode(response.data).toString();
//   return NewsListResponse.fromJson(jsonDecode(data));
// }

}
