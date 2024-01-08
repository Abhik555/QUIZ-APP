import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/main_screen.dart';
import 'package:quiz_app/widgets/question_page.dart';
import 'package:quiz_app/widgets/results_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    currentScreen = MainScreen(changeScreen);
    super.initState();
  }

  void changeScreen() {
    setState(() {
      currentScreen = QuestionsPage(chooseAnswer, onFinishAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  void restartquiz(){
    setState(() {
      currentScreen = QuestionsPage(chooseAnswer, onFinishAnswer);
    });
  }

  void onFinishAnswer() {
    Widget x = ResultPage(List.of(selectedAnswers) , restartquiz);
    selectedAnswers = [];
    setState(() {
      currentScreen = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: currentScreen,
      ),
    );
  }
}
