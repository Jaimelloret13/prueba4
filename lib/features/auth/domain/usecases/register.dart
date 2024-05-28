// Caso de uso para el registro de nuevos usuarios
import '../repositories/auth_repository.dart';

class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<void> execute(String email, String password) {
    return repository.register(email, password);
  }
}
