import 'package:flutter/material.dart';
import 'package:test_web_app/data/questionsanswers.dart';
import 'package:test_web_app/ques_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.choosenAnswers,
    required this.onRestartQuiz,  // Add this line
  }) : super(key: key);

  final List<String> choosenAnswers;
  final VoidCallback onRestartQuiz;  // Add this line

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correctanswer': questions[i].answers.isNotEmpty
            ? questions[i].answers[0]
            : 'No correct answer',
        'user_answers': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotQues = questions.length;
    final numCorrQues = summaryData.where((data) {
      return data['user_answers'] == data['correctanswer'];
    }).length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 144, 100, 181),
            ], // Purple and light purple colors
          ),
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(), // Prevent overscroll effect
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 50, 40, 80), // Adjusted padding
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrQues out of $numTotQues correctly',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: onRestartQuiz,  // Use the passed function here
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
