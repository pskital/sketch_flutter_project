import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/providers/dio_provider.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';

@module
abstract class ApiModule {
  @dev
  @Named('apiUrl')
  String get devApiUrl => 'http://www.api.test.com/';

  @prod
  @Named('apiUrl')
  String get prodApiUrl => 'https://automaniak.azurewebsites.net/';

  UserRestApi provideUserRestApi(
    @Named('apiUrl') String apiUrl,
    DioProvider dioProvider,
  ) {
    return UserRestApi(dioProvider.getDio(), baseUrl: apiUrl);
  }
}
