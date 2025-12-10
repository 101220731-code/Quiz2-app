import '../data/questions.dart';

class QuizQuestion {
  final List<String> shuffledAnswers;
  final String text;
  final List <String> answers;
  final String correctAnswer;

  QuizQuestion({
    required this.answers, required this.correctAnswer, required this.text
  }) : shuffledAnswers = List.of(answers)..shuffle();
}
