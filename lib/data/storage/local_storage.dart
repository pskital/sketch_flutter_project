abstract class LocalStorage {
  Future<void> init();

  Future<void> saveValue<T>(String key, T value);

  Future<T?> getValue<T>(String key);
}
