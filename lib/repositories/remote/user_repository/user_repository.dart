import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sketch_flutter_project/core/api/api_headers.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';

part 'user_repository.g.dart';

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @Headers(ApiHeaders.defaultHeaders)
  @POST('api/User/LoginUser')
  Future<ResponseLoginUserModel> loginUser(
    @Field('login') String login,
    @Field('password') String password,
    @Field('isPrivacyAccepted') bool isPrivacyAccepted,
  );

  @Headers(ApiHeaders.defaultHeaders)
  @POST('api/User/RecoveryPassword')
  Future<ResponseLoginUserModel> recoveryPassword(
    @Field('email') String email,
  );
}
