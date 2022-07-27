import 'package:json_annotation/json_annotation.dart';

part 'response_login_user_model.g.dart';

@JsonSerializable()
class ResponseLoginUserModel {
  @JsonKey(name: 'token')
  String token;

  ResponseLoginUserModel(this.token);

  factory ResponseLoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginUserModelToJson(this);
}
