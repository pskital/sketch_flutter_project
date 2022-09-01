import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/repositories/local/token_repository/token_repository.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImp implements TokenRepository {
  TokenRepositoryImp({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<void> saveToken(String token) async {
    return await localStorage.saveValue(StorageKeys.tokenKey, token);
  }

  @override
  String? getToken() {
    return localStorage.getValue(StorageKeys.tokenKey);
  }
}
