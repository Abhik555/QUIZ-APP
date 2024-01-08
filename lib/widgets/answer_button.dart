import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton(this.question, this.onPress, {super.key});

  final String question;
  final void Function() onPress;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 119),
          padding: const EdgeInsets.all(14.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        widget.question,
        textAlign: TextAlign.center,
      ),
    );
  }
}
