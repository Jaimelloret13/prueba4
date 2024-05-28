// question_service.dart
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import '/features/auth/domain/entities/section.dart';

class QuestionService {
  Future<List<Section>> loadQuestions() async {
    final jsonString = await rootBundle.rootBundle.loadString('assets/questions/codequestions.json');
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return (jsonResponse['sections'] as List)
        .map((section) => Section.fromJson(section))
        .toList();
  }
}
