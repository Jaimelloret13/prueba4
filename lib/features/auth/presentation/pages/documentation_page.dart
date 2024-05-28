import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documentación',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Introducción',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Aquí encontrarás la documentación necesaria para aprender el lenguaje de programación.',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sección 1: Sintaxis Básica',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'En esta sección aprenderás sobre la sintaxis básica del lenguaje, cómo declarar variables, funciones, y más.',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sección 2: Estructuras de Control',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Esta sección cubre las estructuras de control como condicionales, bucles, y más.',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              // Añade más secciones según sea necesario
            ],
          ),
        ),
      ),
    );
  }
}
