import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void quizStarted() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'end-screen';
      });
    }
  }

  void endQuiz() {
    setState(() {
      activeScreen = 'end-screen';
    });
  }

  void restartQuiz() {
    questionsAnswered = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget currentScreen = StartScreen(quizStarted);
    if (activeScreen == 'questions-screen') {
      currentScreen = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
        endQuiz: endQuiz,
      );
    } else if (activeScreen == 'end-screen') {
      currentScreen = ResultsScreen(
        quizRestart: restartQuiz,
        choosenAnswers: selectedAnswers,
      );
      selectedAnswers = [];
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 139, 92, 228),
                  Color.fromARGB(255, 37, 8, 91)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: currentScreen)),
    );
  }
}