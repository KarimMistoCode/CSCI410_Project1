import 'package:flutter/material.dart';
import 'package:project1/home.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Quiz App',
      home: Home(),
    );
  }
}

