import 'package:flutter/material.dart';
import 'package:stem_quiz/screens/create_quiz.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Quiz"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const CreateQuiz(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
