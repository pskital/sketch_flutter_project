import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class StorageProvider {
  static StorageProvider? _instance;

  late LocalStorage localStorage;

  factory StorageProvider({required LocalStorage localStorage}) {
    return _instance ??= StorageProvider._(localStorage);
  }

  StorageProvider._(this.localStorage);

  Future<LocalStorage> initStorage() async {
    await localStorage.init();
    return getLocalStorage();
  }

  static LocalStorage getLocalStorage() {
    assert(_instance != null, 'Local storage provider not initialized');
    return _instance!.localStorage;
  }
}
