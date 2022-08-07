import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';

part 'user_rest_api.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
@RestApi()
abstract class UserRestApi {
  factory UserRestApi(Dio dio, {String baseUrl}) = _UserRestApi;

  @POST('/api/User/LoginUser')
  Future<ResponseLoginUserModel> loginUser(
    @Field('login') String login,
    @Field('password') String password,
    @Field('isPrivacyAccepted') bool isPrivacyAccepted,
  );

  @POST('/api/User/RecoveryPassword')
  Future<ResponseLoginUserModel> recoveryPassword(
    @Field('email') String email,
  );
}
