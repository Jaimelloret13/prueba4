import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/features/auth/domain/entities/question.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(bool) onAnswerSelected;

  QuestionWidget({required this.question, required this.onAnswerSelected});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? _selectedOption;
  bool? _isCorrect;
  bool _answered = false;

  void _verifyAnswer() {
    setState(() {
      _answered = true;
      _isCorrect = widget.question.options?[_selectedOption!] == widget.question.answer;
      widget.onAnswerSelected(_isCorrect!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.question.text!,
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        ...?widget.question.options?.asMap().entries.map((entry) {
          int idx = entry.key;
          String text = entry.value;
          return RadioListTile<int>(
            value: idx,
            groupValue: _selectedOption,
            title: Text(text),
            onChanged: _answered ? null : (int? value) {
              setState(() {
                _selectedOption = value;
              });
            },
            activeColor: Colors.blue,
          );
        }).toList(),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _answered ? null : _verifyAnswer,
          child: Text('Verificar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        if (_answered)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Icon(
                  _isCorrect! ? Icons.check_circle : Icons.cancel,
                  color: _isCorrect! ? Colors.green : Colors.red,
                  size: 48,
                ),
                SizedBox(height: 8),
                Text(
                  _isCorrect! ? '¡Correcto!' : 'Incorrecto, intenta de nuevo.',
                  style: TextStyle(
                    fontSize: 18,
                    color: _isCorrect! ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    widget.onAnswerSelected(_isCorrect!);
                  },
                  child: Text('Siguiente pregunta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
