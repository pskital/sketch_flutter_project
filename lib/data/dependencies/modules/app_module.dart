import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';

@module
abstract class AppModule {

  @preResolve
  Future<LocalStorage> provideLocalStorage(
    SharedPreferencesStorage sharedPreferencesStorage,
  ) async {
    await sharedPreferencesStorage.init();
    return sharedPreferencesStorage;
  }
}
