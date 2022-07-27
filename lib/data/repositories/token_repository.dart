import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class TokenRepository {
  final LocalStorage localStorage;

  TokenRepository({required this.localStorage});

  Future<void> saveToken(String token) async {
    return await localStorage.saveValue(StorageKeys.tokenKey, token);
  }

  String? getToken() {
    return localStorage.getValue(StorageKeys.tokenKey);
  }
}
