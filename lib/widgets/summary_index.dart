import 'package:flutter/material.dart';

class SummaryIndex extends StatelessWidget {
  const SummaryIndex(this.questionIndex, this.isCorrectAns, {super.key});

  final String questionIndex;
  final bool isCorrectAns;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAns ? Colors.lightGreen : Colors.pink,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        // ((questionIndex as int) + 1).toString(),
        questionIndex.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
