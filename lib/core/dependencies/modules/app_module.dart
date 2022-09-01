import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/api/dio_provider.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/repositories/remote/user_repository/user_repository.dart';

@module
abstract class AppModule {
  @dev
  @Named('apiUrl')
  String get devApiUrl => 'http://www.api.test.com/';

  @prod
  @Named('apiUrl')
  String get prodApiUrl => 'https://automaniak.azurewebsites.net/';

  UserRepository provideUserRepository(
    @Named('apiUrl') String apiUrl,
    DioProvider dioProvider,
  ) {
    return UserRepository(dioProvider.getDio(), baseUrl: apiUrl);
  }

  @preResolve
  Future<LocalStorage> provideLocalStorage(
    SharedPreferencesStorage preferencesStorage,
  ) async {
    await preferencesStorage.init();
    return preferencesStorage;
  }
}
