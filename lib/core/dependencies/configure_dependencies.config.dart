// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sketch_flutter_project/core/api/dio_provider.dart' as _i11;
import 'package:sketch_flutter_project/core/dependencies/modules/app_module.dart'
    as _i18;
import 'package:sketch_flutter_project/core/form_validation/user_login_form_validator.dart'
    as _i5;
import 'package:sketch_flutter_project/core/translations/app_translations.dart'
    as _i3;
import 'package:sketch_flutter_project/data/storage/local_storage.dart' as _i6;
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart'
    as _i4;
import 'package:sketch_flutter_project/logic/language/language_bloc.dart'
    as _i16;
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart' as _i14;
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart'
    as _i17;
import 'package:sketch_flutter_project/repositories/local/language_repository/language_repository.dart'
    as _i12;
import 'package:sketch_flutter_project/repositories/local/language_repository/language_repository_imp.dart'
    as _i13;
import 'package:sketch_flutter_project/repositories/local/theme_repository/theme_repository.dart'
    as _i7;
import 'package:sketch_flutter_project/repositories/local/theme_repository/theme_repository_imp.dart'
    as _i8;
import 'package:sketch_flutter_project/repositories/local/token_repository/token_repository.dart'
    as _i9;
import 'package:sketch_flutter_project/repositories/local/token_repository/token_repository_imp.dart'
    as _i10;
import 'package:sketch_flutter_project/repositories/remote/user_repository/user_repository.dart'
    as _i15;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AppTranslations>(_i3.AppTranslations());
  gh.singleton<_i4.SharedPreferencesStorage>(_i4.SharedPreferencesStorage());
  gh.factory<String>(() => appModule.devApiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.factory<String>(() => appModule.prodApiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<_i5.UserLoginFormValidator>(() => _i5.UserLoginFormValidator());
  await gh.factoryAsync<_i6.LocalStorage>(
      () => appModule.provideLocalStorage(get<_i4.SharedPreferencesStorage>()),
      preResolve: true);
  gh.singleton<_i7.ThemeRepository>(
      _i8.ThemeRepositoryImp(localStorage: get<_i6.LocalStorage>()));
  gh.singleton<_i9.TokenRepository>(
      _i10.TokenRepositoryImp(localStorage: get<_i6.LocalStorage>()));
  gh.singleton<_i11.DioProvider>(
      _i11.DioProvider(tokenRepository: get<_i9.TokenRepository>()));
  gh.singleton<_i12.LanguageRepository>(
      _i13.LanguageRepositoryImp(localStorage: get<_i6.LocalStorage>()));
  gh.factory<_i14.ThemeBloc>(
      () => _i14.ThemeBloc(themeRepository: get<_i7.ThemeRepository>()));
  gh.factory<_i15.UserRepository>(() => appModule.provideUserRepository(
      get<String>(instanceName: 'apiUrl'), get<_i11.DioProvider>()));
  gh.factory<_i16.LanguageBloc>(() =>
      _i16.LanguageBloc(languageRepository: get<_i12.LanguageRepository>()));
  gh.factory<_i17.LoginUserBloc>(() => _i17.LoginUserBloc(
      loginFormValidator: get<_i5.UserLoginFormValidator>(),
      tokenRepository: get<_i9.TokenRepository>(),
      userRestApi: get<_i15.UserRepository>()));
  return get;
}

class _$AppModule extends _i18.AppModule {}
