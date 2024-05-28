import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int experienceGained;

  ResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.experienceGained,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de la Lección'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Lección completada!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Respuestas correctas: $correctAnswers / $totalQuestions',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Experiencia ganada: $experienceGained puntos',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Volver al Lobby'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
