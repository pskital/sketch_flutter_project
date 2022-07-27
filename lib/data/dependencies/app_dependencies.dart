import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/data/repositories/translations_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/logic/localization/translation_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';

class AppDependencies {
  late LanguageBloc translationsBloc;
  late ThemeBloc themeBloc;

  Future<void> init() async {
    /**
     * Sorage
     */
    var preferencesStorage = SharedPreferencesStorage();
    var storageProvider = StorageProvider(localStorage: preferencesStorage);
    var localStorage = await storageProvider.initStorage();

    /**
     * Theme
     */
    var themeRepository = ThemeRepository(localStorage: localStorage);
    await themeRepository.initTheme();

    var themeBloc = ThemeBloc(themeRepository: themeRepository);
    this.themeBloc = themeBloc;

    /**
     * Translations
     */
    var assetLoader = const RootBundleAssetLoader();
    var translationsRepository = LanguageRepository(
      localStorage: localStorage,
      assetLoader: assetLoader,
    );
    await translationsRepository.initLang();

    var systemLocales = WidgetsBinding.instance.window.locales;

    var translationsBloc = LanguageBloc(
      languageRepository: translationsRepository,
    );
    await translationsRepository.setSystemLocale(systemLocales);
    this.translationsBloc = translationsBloc;
  }
}
