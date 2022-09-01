import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/repositories/local/language_repository/language_repository.dart';

@Singleton(as: LanguageRepository)
class LanguageRepositoryImp implements LanguageRepository {
  const LanguageRepositoryImp({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<void> saveLanguageCode(LanguageType langType) async {
    return await localStorage.saveValue(StorageKeys.langKey, langType.value);
  }

  @override
  String? getLanguageCode() {
    return localStorage.getValue(StorageKeys.langKey);
  }
}
