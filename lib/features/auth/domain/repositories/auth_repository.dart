// Define la interfaz del repositorio de autenticación

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}
