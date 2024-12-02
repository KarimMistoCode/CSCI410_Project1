import 'package:flutter/material.dart';

class Question{
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question(this.questionText, this.answers, this.correctAnswer);
}