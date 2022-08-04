import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/providers/dio_provider.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository_imp.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository_imp.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository_imp.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_form_validator.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  /**
   * Storage
   */
  var preferencesStorage = SharedPreferencesStorage();
  var storageProvider = StorageProvider(localStorage: preferencesStorage);
  var localStorage = await storageProvider.initStorage();
  serviceLocator.registerSingleton(localStorage);

  /**
   * Theme
   */
  var themeRepository = ThemeRepositoryImp(localStorage: serviceLocator());
  await themeRepository.initTheme();

  serviceLocator.registerSingleton<ThemeRepository>(themeRepository);
  serviceLocator.registerFactory(
    () => ThemeBloc(themeRepository: serviceLocator()),
  );

  /**
   * Language repository
   */
  var languageRepository = LanguageRepositoryImp(
    localStorage: serviceLocator(),
    assetLoader: const RootBundleAssetLoader(),
  );

  var systemLocales = WidgetsBinding.instance.window.locales;
  await languageRepository.setSystemLocale(systemLocales);
  serviceLocator.registerSingleton<LanguageRepository>(languageRepository);
  serviceLocator.registerFactory<LanguageBloc>(() => LanguageBloc(
        languageRepository: serviceLocator(),
      ));

  /**
   * Token repository
   * */
  serviceLocator.registerSingleton<TokenRepository>(
    TokenRepositoryImp(localStorage: serviceLocator()),
  );

  /**
   * Dio provider
   * */
  serviceLocator.registerSingleton<DioProvider>(
    DioProvider(tokenRepository: serviceLocator()),
  );

  /**
   * Login user bloc
   * */
  serviceLocator.registerFactory(
    () => LoginUserBloc(
      loginFormValidator: UserLoginFormValidator(),
      userRestApi: UserRestApi(serviceLocator<DioProvider>().getDio()),
      tokenRepository: serviceLocator(),
    ),
  );
}
