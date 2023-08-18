import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(121, 169, 186, 241),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn Flutter',
            style:  TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: OutlinedButton.icon(
              onPressed: switchScreen,
              label: const Text(
                'Start Quiz',
              ),
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
