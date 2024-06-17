import 'package:flutter/material.dart';
import 'package:test_web_app/data/questionsanswers.dart';
import 'package:test_web_app/questions.dart';
import 'package:test_web_app/result_screen.dart';
import 'testedv1.0.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'Start-Screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }
  
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Start-Screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'Result-Screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'Questions-Screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswers,
      );
    }

    if (activeScreen == 'Result-Screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        onRestartQuiz: restartQuiz,  // Pass the restart function here
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 144, 100, 181),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
