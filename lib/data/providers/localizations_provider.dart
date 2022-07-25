import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/core/localizations/asset_loader.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';

extension StringTranslateExtension on String {
  String tr() => LocalizationsProvider.tr(this);
}

class LocalizationsProvider {
  Locale? systemLocale;

  static const supportedLocales = [Locale('pl', 'PL'), Locale('en', 'EN')];
  static const defaultLocale = Locale('en', 'EN');

  final assetLoader = const RootBundleAssetLoader();
  final path = 'assets/translations';

  static LocalizationsProvider? _instance;

  static LocalizationsProvider get() {
    assert(_instance != null, 'Localizations provider not initialized');
    return _instance!;
  }

  final LocalizationsRepository localizationsRepository;

  factory LocalizationsProvider(
      LocalizationsRepository localizationsRepository) {
    return _instance ??= LocalizationsProvider._(localizationsRepository);
  }

  LocalizationsProvider._(this.localizationsRepository);

  Map<String, String> _translations = {};

  Locale getLocale() {
    Locale? locale;

    var langType = localizationsRepository.langType;
    var langTypeValue = langType.value;
    switch (langType) {
      case LangType.system:
        locale = systemLocale;
        break;
      default:
        locale = Locale(langTypeValue, langTypeValue.toUpperCase());
        break;
    }

    if (locale == null) {
      locale = defaultLocale;
      return locale;
    }
    if (supportedLocales
        .map((e) => e.languageCode)
        .contains(locale.languageCode)) {
      return locale;
    }
    return defaultLocale;
  }

  static String tr(String key) {
    final translation = LocalizationsProvider.get()._translations[key];
    if (translation == null) {
      return key;
    }
    return translation;
  }

  Future loadTranslations() async {
    var data = await assetLoader.load(path, Locale(getLocale().languageCode));
    _translations = Map<String, String>.from(data);
  }
}
