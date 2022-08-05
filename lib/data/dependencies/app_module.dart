import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/providers/dio_provider.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository_imp.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository_imp.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';

@module
abstract class AppModule {
  @dev
  @Named('apiUrl')
  String get devApiUrl => 'http://www.api.test.com/';

  @prod
  @Named('apiUrl')
  String get prodApiUrl => 'https://automaniak.azurewebsites.net/';

  @preResolve
  Future<LocalStorage> provideLocalStorage(
    SharedPreferencesStorage sharedPreferencesStorage,
  ) async {
    await sharedPreferencesStorage.init();
    return sharedPreferencesStorage;
  }

  @preResolve
  Future<ThemeRepository> provideThemeRepository(
    ThemeRepositoryImp themeRepositoryImp,
  ) async {
    await themeRepositoryImp.initTheme();
    return themeRepositoryImp;
  }

  @preResolve
  Future<LanguageRepository> provideLanguageRepository(
    LanguageRepositoryImp languageRepository,
  ) async {
    var systemLocales = WidgetsBinding.instance.window.locales;
    await languageRepository.setSystemLocale(systemLocales);
    return languageRepository;
  }

  UserRestApi provideUserRestApi(
    @Named('apiUrl') String apiUrl,
    DioProvider dioProvider,
  ) {
    return UserRestApi(dioProvider.getDio(), baseUrl: apiUrl);
  }
}
