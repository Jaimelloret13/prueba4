import 'question.dart';

class Section {
  final String title;
  final String description;
  final List<Question> questions;

  Section({
    required this.title,
    required this.description,
    required this.questions,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'] as String,
      description: json['description'] as String,
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}
