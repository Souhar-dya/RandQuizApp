import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/image.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          onRestart: restart,
          answers: selectedAnswer,
        );
      });
    }
  }

  void restart() {
    selectedAnswer = [];
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(
        onchosen: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 75, 8, 123),
              Color.fromARGB(255, 117, 4, 215)
            ])),
        child: activeScreen,
      )),
    );
  }
}
