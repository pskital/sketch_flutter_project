import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class TranslationsRepository {
  final LocalStorage localStorage;

  late LangType langType;

  final _defaultLocale = const Locale('en', 'EN');

  final _supportedLocales = [
    const Locale('pl', 'PL'),
    const Locale('en', 'EN'),
  ];

  final _assetsPath = 'assets/translations';

  static Map<String, String> _translations = {};

  RootBundleAssetLoader assetLoader;
  Locale? _systemLocale;

  TranslationsRepository(
      {required this.localStorage, required this.assetLoader});

  Future<void> initLang() async {
    langType = await getLangType();
  }

  setLang(LangType langType) async {
    var value = langType.value;
    this.langType = langType;

    await saveLang(value);
    await loadTranslations();
  }

  Future<void> saveLang(String lang) async {
    return await localStorage.saveValue(StorageKeys.langKey, lang);
  }

  Future<LangType> getLangType() async {
    var lang = await localStorage.getValue(StorageKeys.langKey);
    return LangType.values.firstWhere((t) {
      var type = t.toString().split('.').last;
      return type == lang;
    }, orElse: () => LangType.system);
  }

  String? getLangCode() {
    return getSystemLocale()?.languageCode;
  }

  static String tr(String key) {
    final translation = _translations[key];
    if (translation == null) {
      return key;
    }
    return translation;
  }

  setSystemLocale(List<Locale>? locales) async {
    if (locales != null && locales.isNotEmpty) {
      _systemLocale = locales.first;
      await loadTranslations();
    }
  }

  Locale? getSystemLocale() {
    return _systemLocale;
  }

  Locale getLocale() {
    Locale? locale;
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

  loadTranslations() async {
    var code = getLocale().languageCode;
    var data = await assetLoader.load(_assetsPath, Locale(code));
    _translations = Map<String, String>.from(data);
  }
}
