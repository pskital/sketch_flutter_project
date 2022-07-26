import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class LocalizationsRepository {
  final LocalStorage localStorage;

  late LangType _langType;

  LocalizationsRepository({required this.localStorage});

  LangType get langType => _langType;

  Future<void> initLang() async {
    _langType = await getLangType();
  }

  Future<void> setLang(LangType lang) async {
    var value = lang.value;
    await saveLang(value);
    _langType = lang;
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
}
