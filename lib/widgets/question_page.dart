import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.chooseAnswer,this.onFinishAnswer, {super.key});

  final void Function(String answer) chooseAnswer;
  final void Function() onFinishAnswer;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var questionsIndex;

  @override
  void initState() {
    questionsIndex = 0;
    super.initState();
  }

  void onAnswer(String choice) {
    widget.chooseAnswer(choice);
    if (questionsIndex + 1 < questions.length) {
      setState(() {
        questionsIndex++;
      });
    } else {
      widget.onFinishAnswer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionsIndex];

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromARGB(255, 88, 27, 194)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.Question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.GetShuffuledList().map((i) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: AnswerButton(i, () {
                    onAnswer(i);
                  }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
