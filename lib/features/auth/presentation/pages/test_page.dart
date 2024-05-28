import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'category_notification_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _answers = {};
  List<dynamic> _questions = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final String response = await rootBundle.loadString('assets/questions/questions.json');
      final data = await json.decode(response);
      setState(() {
        _questions = data['questions'];
      });
    } catch (e) {
      print("Error loading questions: $e");
    }
  }

  Future<void> _submitTest(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final category = _determineCategory(_answers);
    await prefs.setString('userCategory', category);

    /*Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CategoryNotificationPage(category: category)),
    );*/
  }

  String _determineCategory(Map<String, dynamic> answers) {
    // Lógica para determinar la categoría basada en las respuestas
    // Aquí puedes implementar la lógica para categorizar al usuario
    return 'intermedio'; // Ejemplo de categoría
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Inicial')),
      body: _questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PageView(
              controller: _pageController,
              children: [
                _buildIntroPage(),
                ..._questions.map((question) => _buildQuestionPage(question)).toList(),
                _buildSummaryPage(),
              ],
            ),
    );
  }

  Widget _buildIntroPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido al Test Inicial',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Este test nos ayudará a conocerte mejor y adaptar la experiencia de aprendizaje a tus necesidades. Por favor, responde con honestidad para obtener una categorización precisa.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Comenzar'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionPage(Map<String, dynamic> question) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ..._buildOptions(question),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Siguiente'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOptions(Map<String, dynamic> question) {
    if (question['options'].isEmpty) {
      return [
        TextFormField(
          decoration: InputDecoration(labelText: 'Respuesta'),
          onChanged: (value) {
            _answers[question['question']] = value;
          },
        )
      ];
    } else {
      return question['options'].map<Widget>((option) {
        return ListTile(
          title: Text(option),
          leading: Radio(
            value: option,
            groupValue: _answers[question['question']],
            onChanged: (value) {
              setState(() {
                _answers[question['question']] = value;
              });
            },
          ),
        );
      }).toList();
    }
  }

  Widget _buildSummaryPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¡Gracias por completar el test!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Tu participación nos ayudará a personalizar tu experiencia de aprendizaje. ¡Ahora estás listo para comenzar tu viaje de programación con CodeLingo!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => _submitTest(context),
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
