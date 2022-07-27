abstract class LocalStorage {
  Future<void> init();

  Future<void> saveValue<T>(String key, T value);

  T? getValue<T>(String key);
}
