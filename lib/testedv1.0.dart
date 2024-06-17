import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz.png',width: 300,color: const Color.fromARGB(172, 255, 255, 255)),

          const SizedBox(height: 80),
          const Text(
            'Welcome to the Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(onPressed: 
            startQuiz,
             style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          
          ),
          icon: Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
