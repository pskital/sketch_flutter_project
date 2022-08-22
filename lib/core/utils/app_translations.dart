import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/translations/translations.i69n.dart';
import 'package:sketch_flutter_project/data/translations/translations_pl.i69n.dart';

@singleton
class AppTranslations {
  static Translations _translations = const Translations();

  final Map<String, Translations Function()> _translationsMap =
      <String, Translations Function()>{
    'en': () => const Translations(),
    'pl': () => const Translations_pl(),
  };

  void setCurrentTranslations(String code) {
    _translations = _translationsMap[code]!();
  }

  static Translations get() {
    return _translations;
  }
}

Translations get translations => AppTranslations.get();
