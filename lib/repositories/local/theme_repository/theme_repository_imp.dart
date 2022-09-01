import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/repositories/local/theme_repository/theme_repository.dart';

@Singleton(as: ThemeRepository)
class ThemeRepositoryImp implements ThemeRepository {
  ThemeRepositoryImp({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<void> saveTheme(ThemeType theme) async {
    await localStorage.saveValue(StorageKeys.themeKey, theme.value);
  }

  @override
  String? getTheme() {
    return localStorage.getValue(StorageKeys.themeKey);
  }
}
