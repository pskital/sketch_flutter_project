import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class LocalStorageProvider {
  static LocalStorageProvider? _instance;

  late LocalStorage localStorage;

  factory LocalStorageProvider({required LocalStorage localStorage}) {
    return _instance ??= LocalStorageProvider._(localStorage);
  }

  LocalStorageProvider._(this.localStorage);

  Future<LocalStorage> initStorage() async {
    await localStorage.init();
    return getLocalStorage();
  }

  static LocalStorage getLocalStorage() {
    assert(_instance != null, 'Local storage provider not initialized');
    return _instance!.localStorage;
  }
}
