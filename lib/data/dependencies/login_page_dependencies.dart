import 'package:sketch_flutter_project/data/providers/dio_provider.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';

mixin LoginPageDependencies {
  LoginUserBloc createLoginUserBloc() {
    var localStorage = StorageProvider.getLocalStorage();
    var tokenRepository = TokenRepository(localStorage: localStorage);
    var dio = DioProvider(tokenRepository: tokenRepository).getDio();
    var userRestApi = UserRestApi(dio);
    return LoginUserBloc(
      tokenRepository: tokenRepository,
      userRestApi: userRestApi,
    );
  }
}
