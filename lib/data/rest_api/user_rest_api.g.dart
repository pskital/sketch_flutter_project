// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rest_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserRestApi implements UserRestApi {
  _UserRestApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseLoginUserModel> loginUser(login, password) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'login': login,
      r'password': password
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseLoginUserModel>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, '/api/User/LoginUser',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseLoginUserModel.fromJson(result.data!);
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
