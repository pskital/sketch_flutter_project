import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';

class TokenRepository {
  final LocalStorage _localStorage = LocalStorageProvider.getLocalStorage();

  Future<void> saveToken(String? token) async {
    await _localStorage.saveValue(StorageKeys.tokenKey, token);
  }

  Future<String?> getToken() async {
    return _localStorage.getValue(StorageKeys.tokenKey);
  }
}
