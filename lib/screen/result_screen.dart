import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/questions.dart';
import 'package:flutter_quiz_app/widgets/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers,this.resetQuiz, {super.key});

  final List<String> chosenAnswers;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_ans': questions[i].answers[0],
        'chosen_ans': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final correctValue = summaryData
        .where(
          (element) => element['chosen_ans'] == element['correct_ans'],
        )
        .length;

    return SizedBox(
      width: double.infinity, // it takes as much as width to fit its content
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $correctValue out of $totalQuestion correctly',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Summary(summaryData),
            TextButton(
              onPressed: resetQuiz,
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
