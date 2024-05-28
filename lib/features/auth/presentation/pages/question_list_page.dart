import 'package:flutter/material.dart';
import '/features/auth/domain/entities/section.dart';
import '/features/auth/presentation/pages/result_page.dart';
import '/features/auth/domain/entities/user.dart';
import '/features/auth/presentation/widgets/question_widget.dart';

class QuestionListPage extends StatefulWidget {
  final Section section;
  final User user;

  QuestionListPage({required this.section, required this.user});

  @override
  _QuestionListPageState createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  PageController _controller = PageController();
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  void _onAnswerSelected(bool isCorrect) {
    if (isCorrect) {
      _correctAnswers++;
    }

    if (_currentQuestionIndex < widget.section.questions.length - 1) {
      _currentQuestionIndex++;
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      int experienceGained = _correctAnswers * 10;
      widget.user.addExperience(experienceGained);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            correctAnswers: _correctAnswers,
            totalQuestions: widget.section.questions.length,
            experienceGained: experienceGained,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.section.title),
      ),
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.section.questions.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            question: widget.section.questions[index],
            onAnswerSelected: _onAnswerSelected,
          );
        },
      ),
    );
  }
}
