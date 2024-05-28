// Implementación del repositorio de autenticación. Mocks

import '../../domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(String email, String password) async {
    // Simulación de inicio de sesión
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Future<void> register(String email, String password) async {
    // Simulación de registro
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Future<void> logout() async {
    // Simulación de cierre de sesión
    await Future.delayed(Duration(seconds: 1));
    return;
  }
}
