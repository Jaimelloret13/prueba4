// Maneja el estado de autenticación utilizando el patron BLoC
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      yield AuthInitial();
    } else if (event is RegisterEvent) {
      yield AuthLoading();
      try {
        // Simulación de registro exitoso
        await Future.delayed(Duration(seconds: 1)); // Simular un retraso
        yield AuthAuthenticated(event.email);
      } catch (e) {
        yield AuthError("Failed to register");
      }
    } else if (event is LoginEvent) {
      yield AuthLoading();
      try {
        // Simulación de inicio de sesión exitoso
        await Future.delayed(Duration(seconds: 1)); // Simular un retraso
        yield AuthAuthenticated(event.email);
      } catch (e) {
        yield AuthError("Failed to login");
      }
    }
  }
}
