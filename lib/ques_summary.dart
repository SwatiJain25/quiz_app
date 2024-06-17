import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});
  
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Prevent ListView from scrolling independently
      itemCount: summaryData.length,
      itemBuilder: (context, index) {
        final data = summaryData[index];
        final question = data['question'] as String? ?? 'Unknown question';
        final userAnswer = data['user_answers'] as String? ?? 'No answer';
        final correctAnswer = data['correctanswer'] as String? ?? 'No correct answer';

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text((index + 1).toString()),  // Display the index+1 for question number
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('Your Answer: $userAnswer', style: const TextStyle(color: Colors.red)),
                    Text('Correct Answer: $correctAnswer', style: const TextStyle(color: Colors.green)),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
