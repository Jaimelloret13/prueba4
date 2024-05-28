import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/features/auth/domain/entities/user.dart';

class ExercisePage extends StatelessWidget {
  final User user;

  ExercisePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Aquí irán los ejercicios',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
