import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final Function(int, String) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: 
    Padding(padding: EdgeInsetsGeometry.all(20), child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          //asMap is a function that creates a map of the list.
          //The map uses the indices of this list as keys and the corresponding objects as values.
          ...questions.asMap().entries.map((entry) {
            int qIndex = entry.key;
            var question = entry.value;

            return QuestionItem(
              questionIndex: qIndex,
              question: question,			  
              onSelectAnswer: onSelectAnswer,
              nb: qIndex +1,
            );
          }),

          const SizedBox(height: 20),
          ElevatedButton(onPressed: () => _submit, child: Text("submit"))
        ],
      ),) )
    );
  }
}
