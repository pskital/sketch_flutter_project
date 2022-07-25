import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class LocalizationsRepository {
  final LocalStorage _localStorage = LocalStorageProvider.getLocalStorage();

  late LangType _langType;

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
    return await _localStorage.saveValue(StorageKeys.langKey, lang);
  }

  Future<LangType> getLangType() async {
    var lang = await _localStorage.getValue(StorageKeys.langKey);
    return LangType.values.firstWhere((t) {
      var type = t.toString().split('.').last;
      return type == lang;
    }, orElse: () => LangType.system);
  }
}
