// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rest_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserRestApi implements UserRestApi {
  _UserRestApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://automaniak.azurewebsites.net/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseLoginUserModel> loginUser(
      login, password, isPrivacyAccepted) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'login': login,
      r'password': password,
      r'isPrivacyAccepted': isPrivacyAccepted
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseLoginUserModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/User/LoginUser',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseLoginUserModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
