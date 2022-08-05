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
      @Query('login') String login,
      @Query('password') String password,
      @Query('isPrivacyAccepted') bool isPrivacyAccepted);
}
