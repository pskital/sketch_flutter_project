import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/api/curl_interceptor.dart';
import 'package:sketch_flutter_project/repositories/local/token_repository/token_repository.dart';

@singleton
class DioProvider {
  DioProvider({required this.tokenRepository});

  final TokenRepository tokenRepository;

  Dio getDio() {
    final Dio dio = Dio();
    dio.interceptors.add(CurlInterceptor());
    dio.options.responseType = ResponseType.json;
    dio.options.connectTimeout = 10000;

    final String? token = tokenRepository.getToken();
    if (token != null) {
      dio.options.headers['Authorization'] = token;
    }

    return dio;
  }
}
