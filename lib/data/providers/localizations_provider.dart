import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';

class LocalizationsProvider {
  final _defaultLocale = const Locale('en', 'EN');

  final _supportedLocales = [
    const Locale('pl', 'PL'),
    const Locale('en', 'EN'),
  ];

  final _assetLoader = const RootBundleAssetLoader();
  final _assetsPath = 'assets/translations';

  static LocalizationsProvider? _instance;

  Map<String, String> _translations = {};

  Locale? _systemLocale;

  final LocalizationsRepository localizationsRepository;

  factory LocalizationsProvider({
    required LocalizationsRepository localizationsRepository,
  }) {
    return _instance ??= LocalizationsProvider._(localizationsRepository);
  }

  LocalizationsProvider._(this.localizationsRepository);

  static LocalizationsProvider getInstance() {
    LocalizationsProvider? localizationsProvider = _instance;
    if (localizationsProvider != null) {
      return localizationsProvider;
    } else {
      throw Exception('Localizations provider not initialized');
    }
  }

  static String tr(String key) {
    final translation = LocalizationsProvider.getInstance()._translations[key];
    if (translation == null) {
      return key;
    }
    return translation;
  }

  void setSystemLocale(List<Locale>? locales) {
    _systemLocale = locales?.first;
  }

  Locale? getSystemLocale() {
    return _systemLocale;
  }

  Locale getLocale() {
    Locale? locale;

    var langType = localizationsRepository.langType;
    var langTypeValue = langType.value;
    switch (langType) {
      case LangType.system:
        locale = _systemLocale;
        break;
      default:
        locale = Locale(
          langTypeValue,
          langTypeValue.toUpperCase(),
        );
        break;
    }

    if (locale != null && _isLocaleSupported(locale)) {
      return locale;
    } else {
      return _defaultLocale;
    }
  }

  bool _isLocaleSupported(Locale locale) {
    return _supportedLocales
        .map((e) => e.languageCode)
        .contains(locale.languageCode);
  }

  Future loadTranslations() async {
    var data = await _assetLoader.load(
        _assetsPath,
        Locale(
          getLocale().languageCode,
        ));
    _translations = Map<String, String>.from(data);
  }
}
