import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/repositories/theme_repository/theme_repository_imp.dart';

@module
abstract class RepositoryModule {
  @preResolve
  Future<ThemeRepository> provideThemeRepository(
    ThemeRepositoryImp themeRepositoryImp,
  ) async {
    await themeRepositoryImp.initTheme();
    return themeRepositoryImp;
  }
}
