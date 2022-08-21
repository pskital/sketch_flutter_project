import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart';

@singleton
class DioProvider {
  DioProvider({required this.tokenRepository});

  final TokenRepository tokenRepository;

  Dio getDio() {
    final LogInterceptor logInterceptor = LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    );

    final Dio dio = Dio();
    dio.interceptors.add(logInterceptor);
    dio.options.responseType = ResponseType.json;
    dio.options.connectTimeout = 10000;

    final String? token = tokenRepository.getToken();
    if (token != null) {
      dio.options.headers['Authorization'] = token;
    }

    return dio;
  }
}
