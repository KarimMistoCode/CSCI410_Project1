import 'package:flutter/material.dart';
import 'package:project1/question.dart';
import 'package:project1/page_two.dart'; // Import the new page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Question> _questions = [
    Question('Who won the 2022 Ballon d\'Or?', ['Banzema', 'Messi', 'Mbappe', 'Vinicius'], 'Banzema'),
    Question('WWho won the 2023 Ballon d\'Or?', ['Haland', 'Messi', 'Mbappe', 'Vinicius'], 'Messi'),
    Question('Who won the 2024 Ballon d\'Or?', ['Billengham', 'Rodri', 'Carvjal', 'Vinicius'], 'Rodri'),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _nextQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex].correctAnswer) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        int finalscore=_score;
        // Navigate to PageTwo
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageTwo(
              score: finalscore,
              totalQuestions: _questions.length,
            ),
          ),
        );

        // Reset quiz state
        _currentQuestionIndex = 0;
        _score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            for (var answer in currentQuestion.answers)
              ElevatedButton(
                onPressed: () => _nextQuestion(answer),
                child: Text(answer),
              ),
          ],
        ),
      ),
    );
  }
}
