// contiene funciones para la navegación entre las pantallas
import 'package:flutter/material.dart';

void navigateToLogin(BuildContext context) {
  Navigator.pushNamed(context, '/login');
}

void navigateToRegister(BuildContext context) {
  Navigator.pushNamed(context, '/register');
}

void navigateToForgotPassword(BuildContext context) {
  Navigator.pushNamed(context, '/forgot-password');
}
