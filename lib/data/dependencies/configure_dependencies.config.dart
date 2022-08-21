// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sketch_flutter_project/core/utils/asset_loader.dart' as _i3;
import 'package:sketch_flutter_project/core/validation/user_login_form_validator.dart'
    as _i5;
import 'package:sketch_flutter_project/data/dependencies/modules/api_module.dart'
    as _i18;
import 'package:sketch_flutter_project/data/dependencies/modules/app_module.dart'
    as _i19;
import 'package:sketch_flutter_project/data/dependencies/modules/repository_module.dart'
    as _i20;
import 'package:sketch_flutter_project/data/providers/dio_provider.dart'
    as _i10;
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart'
    as _i14;
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository_imp.dart'
    as _i11;
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart'
    as _i12;
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository_imp.dart'
    as _i7;
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart'
    as _i8;
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository_imp.dart'
    as _i9;
import 'package:sketch_flutter_project/data/storage/local_storage.dart' as _i6;
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart'
    as _i4;
import 'package:sketch_flutter_project/logic/language/language_bloc.dart'
    as _i17;
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart' as _i16;
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart'
    as _i15;
import 'package:sketch_flutter_project/rest_api/user_rest_api.dart' as _i13;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final appModule = _$AppModule();
  final repositoryModule = _$RepositoryModule();
  gh.factory<_i3.RootBundleAssetLoader>(() => _i3.RootBundleAssetLoader());
  gh.singleton<_i4.SharedPreferencesStorage>(_i4.SharedPreferencesStorage());
  gh.factory<String>(() => apiModule.devApiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.factory<String>(() => apiModule.prodApiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<_i5.UserLoginFormValidator>(() => _i5.UserLoginFormValidator());
  await gh.singletonAsync<_i6.LocalStorage>(
      () => appModule.provideLocalStorage(get<_i4.SharedPreferencesStorage>()),
      preResolve: true);
  gh.factory<_i7.ThemeRepositoryImp>(
      () => _i7.ThemeRepositoryImp(localStorage: get<_i6.LocalStorage>()));
  gh.factory<_i8.TokenRepository>(
      () => _i9.TokenRepositoryImp(localStorage: get<_i6.LocalStorage>()));
  gh.singleton<_i10.DioProvider>(
      _i10.DioProvider(tokenRepository: get<_i8.TokenRepository>()));
  gh.factory<_i11.LanguageRepositoryImp>(() => _i11.LanguageRepositoryImp(
      localStorage: get<_i6.LocalStorage>(),
      assetLoader: get<_i3.RootBundleAssetLoader>()));
  await gh.factoryAsync<_i12.ThemeRepository>(
      () => repositoryModule
          .provideThemeRepository(get<_i7.ThemeRepositoryImp>()),
      preResolve: true);
  gh.factory<_i13.UserRestApi>(() => apiModule.provideUserRestApi(
      get<String>(instanceName: 'apiUrl'), get<_i10.DioProvider>()));
  await gh.factoryAsync<_i14.LanguageRepository>(
      () => repositoryModule
          .provideLanguageRepository(get<_i11.LanguageRepositoryImp>()),
      preResolve: true);
  gh.factory<_i15.LoginUserBloc>(() => _i15.LoginUserBloc(
      loginFormValidator: get<_i5.UserLoginFormValidator>(),
      tokenRepository: get<_i8.TokenRepository>(),
      userRestApi: get<_i13.UserRestApi>()));
  gh.factory<_i16.ThemeBloc>(
      () => _i16.ThemeBloc(themeRepository: get<_i12.ThemeRepository>()));
  gh.factory<_i17.LanguageBloc>(() =>
      _i17.LanguageBloc(languageRepository: get<_i14.LanguageRepository>()));
  return get;
}

class _$ApiModule extends _i18.ApiModule {}

class _$AppModule extends _i19.AppModule {}

class _$RepositoryModule extends _i20.RepositoryModule {}
