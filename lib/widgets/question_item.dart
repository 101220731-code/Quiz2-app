import 'package:flutter/material.dart';
import '../models/quiz_question.dart';

class QuestionItem extends StatelessWidget {
  final int questionIndex;
  final QuizQuestion question;
  final Function(int, String) onSelectAnswer;
  final int nb;

  const QuestionItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.onSelectAnswer,
    required this.nb
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Text(
              
              question.text, 
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
