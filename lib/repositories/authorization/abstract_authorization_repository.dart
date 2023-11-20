abstract class AbstractAuthorizationRepository {
  Future<void> login(String username, String password);
  Future<bool> checkTokenExpired(String? token);
}
