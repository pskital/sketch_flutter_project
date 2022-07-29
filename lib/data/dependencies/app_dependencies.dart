import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/logic/localization/language_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';

class AppDependencies {
  late LanguageBloc languageBloc;
  late ThemeBloc themeBloc;

  Future<void> init() async {
    /**
     * Storage
     */
    var preferencesStorage = SharedPreferencesStorage();
    var storageProvider = StorageProvider(localStorage: preferencesStorage);
    var localStorage = await storageProvider.initStorage();

    /**
     * Theme
     */
    var themeRepository = ThemeRepository(localStorage: localStorage);
    await themeRepository.initTheme();

    themeBloc = ThemeBloc(themeRepository: themeRepository);

    /**
     * Language
     */
    var assetLoader = const RootBundleAssetLoader();
    var languageRepository = LanguageRepository(
      localStorage: localStorage,
      assetLoader: assetLoader,
    );

    var systemLocales = WidgetsBinding.instance.window.locales;
    await languageRepository.setSystemLocale(systemLocales);

    var languageBloc = LanguageBloc(languageRepository: languageRepository);
    this.languageBloc = languageBloc;
  }
}
