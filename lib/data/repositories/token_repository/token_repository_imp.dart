import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class TokenRepositoryImp implements TokenRepository {
  final LocalStorage localStorage;

  TokenRepositoryImp({required this.localStorage});

  @override
  Future<void> saveToken(String token) async {
    return await localStorage.saveValue(StorageKeys.tokenKey, token);
  }

  @override
  String? getToken() {
    return localStorage.getValue(StorageKeys.tokenKey);
  }
}
