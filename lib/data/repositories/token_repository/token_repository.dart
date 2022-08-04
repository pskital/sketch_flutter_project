abstract class TokenRepository {
  Future<void> saveToken(String token);

  String? getToken();
}
