class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;
  
   List<String> getShuffledAnswers() {
    final shuffledAns = List.of(answers);
    shuffledAns.shuffle();
    return shuffledAns;
  }
}