import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/questions.dart';
import 'package:flutter_quiz_app/widgets/buttons.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelect, {super.key});

  final void Function(String ans) onSelect;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void updateQuestionIndex(answer) {
    widget.onSelect(answer);
    if (questions.length <= currentQuestionIndex) {
      currentQuestionIndex = 0;
      return;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // width: double.infinity, // it takes as much as width to fit its content
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ...currentQuestion
                  .getShuffledAnswers()
                  .map((item) => AnswerButton(item, () {
                        updateQuestionIndex(item);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
