import 'package:flutter/material.dart';
import 'package:nouralzahraa_hijazi/models/quiz_question.dart';
import 'data/questions.dart';
import 'screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int score =0;
  // selectedAnswers is initially filled with empty strings indicating that the question is not yet answered.
  List<String> selectedAnswers = List.filled(
    questions.length,
    "",
  );

  String activeScreenName = "questions-screen";

  void _restart() {
    setState(() {
      selectedAnswers = List.filled(questions.length, "");
      activeScreenName = 'questions-screen';
    });
  }

  void _submit( QuizQuestion q){
    setState(() {
     
      activeScreenName ='result-screen';
    });
  }

  QuizQuestion getNumberOfCorrectAnswers(){
    int c = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        c++;
      }
    }
    return c;
  }

  void _selectAnswer(int index, String answer){

  }

  @override
  Widget build(BuildContext context) {
    Widget? activeScreen;

    if (activeScreenName == "questions-screen") {
      activeScreen = QuestionScreen(
        selectedAnswers: selectedAnswers,
        onSubmit: _submit,
      );
    } else {
      activeScreen = ResultScreen(
        nC : getNumberOfCorrectAnswers(),
        onRestart: _restart,
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      body: activeScreen,
    );
  }


