import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/summary_index.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final isCorrectAns = data['correct_ans'] == data['chosen_ans'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryIndex((data['question_index'] + 1).toString(), isCorrectAns),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['correct_ans'] as String,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                data['chosen_ans'] as String,
                textAlign: TextAlign.left,
              )
            ],
          ),
        )
      ],
    );
  }
}
