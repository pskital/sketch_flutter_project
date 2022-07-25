import 'package:get_storage/get_storage.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class GetXStorage implements LocalStorage {
  late GetStorage _getStorage;

  @override
  Future<T?> getValue<T>(String key) async {
    return _getStorage.read(key);
  }

  @override
  Future<void> init() async {
    await GetStorage.init();
    _getStorage = GetStorage();
  }

  @override
  Future<void> saveValue<T>(String key, T value) {
    return _getStorage.write(key, value);
  }
}
