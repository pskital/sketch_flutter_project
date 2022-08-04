import 'package:dio/dio.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart';

class DioProvider {
  final TokenRepository tokenRepository;

  DioProvider({required this.tokenRepository});

  Dio getDio() {
    var logInterceptor = LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    );

    var dio = Dio();
    dio.interceptors.add(logInterceptor);
    dio.options.responseType = ResponseType.json;

    var token = tokenRepository.getToken();
    if (token != null) {
      dio.options.headers['Authorization'] = token;
    }

    return dio;
  }
}
