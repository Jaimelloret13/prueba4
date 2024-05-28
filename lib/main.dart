import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba4/features/auth/presentation/pages/main_lobby_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/entities/user.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';
import 'features/auth/presentation/pages/category_notification_page.dart';
import 'features/auth/presentation/pages/forgot_password_page.dart';
import 'features/auth/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/onboarding_page.dart';
import 'features/auth/presentation/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepositoryImpl();
    final loginUseCase = Login(authRepository);
    final registerUseCase = Register(authRepository);

    User user = User(
      email: 'test@example.com',
      name: 'Jaime Lloret',
      nickname: 'jlloret',
      emergencyNumber: '+1-987654321',
      followers: ['Follower1', 'Follower2'],
      following: ['Following1', 'Following2'],
      badges: ['Beginner', 'Intermediate'],
      statistics: {
        'XP': 2641,
        'Lecciones Completadas': 24,
        'Días Seguidos': 231,
      },
    );

    return BlocProvider(
      create: (context) => AuthBloc()..add(AppStartedEvent()),
      child: MaterialApp(
        title: 'CodeLingo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainLobbyPage(user: user),
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/forgot-password': (context) => ForgotPasswordPage(),
          '/onboarding': (context) => OnboardingPage(),
          //'/category-notification': (context) => CategoryNotificationPage(user: user, category: ''),
          '/exercise': (context) => ExercisePage(user: user),
          // Agregar más rutas según sea necesario
        },
      ),
    );
  }
}
