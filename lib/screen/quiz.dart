import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/questions.dart';
import 'package:flutter_quiz_app/screen/question_screen.dart';
import 'package:flutter_quiz_app/screen/result_screen.dart';
import 'package:flutter_quiz_app/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void addChosenAns(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(addChosenAns);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswers,restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
