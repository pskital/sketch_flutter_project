import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/language.dart';
import 'package:sketch_flutter_project/core/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/core/translations/translations.i69n.dart';
import 'package:sketch_flutter_project/core/translations/translations_pl.i69n.dart';

@singleton
class AppTranslations {
  final Map<String, Translations Function()> translationsMap =
      <String, Translations Function()>{
    Language.langCodeEN: () => const Translations(),
    Language.langCodePL: () => const Translations_pl(),
  };

  late Translations _translations =
      translationsMap[Language.defaultLanguageCode]!();

  void setTranslations(String code) {
    _translations = translationsMap[code]!();
  }

  Translations get() {
    return _translations;
  }
}

Translations get translations => serviceLocator<AppTranslations>().get();
