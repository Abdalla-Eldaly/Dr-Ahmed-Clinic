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
