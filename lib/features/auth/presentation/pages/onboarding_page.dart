// Define la pantalla de onboarding
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class OnboardingPage extends StatelessWidget {
  final PageController _pageController = PageController();

  void _goToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
            context,
            'assets/images/svg/my_app.svg',
            'Bienvenido a CodeLingo',
            'Aprende a programar de manera efectiva y divertida.',
          ),
          _buildPage(
            context,
            'assets/images/svg/online_learning.svg',
            'Desafíos Interactivos',
            'Responde a ejercicios de programación y mejora tus habilidades.',
          ),
          _buildPage(
            context,
            'assets/images/svg/researching.svg',
            'Únete a la Comunidad',
            'Conéctate con otros programadores y comparte tu progreso.',
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
      BuildContext context, String imagePath, String title, String description,
      {bool isLastPage = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath, width: 200, height: 200),  // Actualizado para cargar SVG
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          if (isLastPage)
            ElevatedButton(
              onPressed: () => _goToHome(context),
              child: Text('Comenzar'),
            )
          else
            ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text('Siguiente'),
            ),
          TextButton(
            onPressed: () => _goToHome(context),
            child: Text('Omitir'),
          ),
        ],
      ),
    );
  }
}
