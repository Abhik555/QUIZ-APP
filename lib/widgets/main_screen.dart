import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(this.btnfn, {super.key});

  final void Function() btnfn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 300),
            const SizedBox(height: 30),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: btnfn,
              icon: const Icon(Icons.arrow_right_alt,
                  color: Colors.white, size: 18),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
