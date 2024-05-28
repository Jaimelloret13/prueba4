// Caso de uso para el inicio de sesión
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<void> execute(String email, String password) {
    return repository.login(email, password);
  }
}
