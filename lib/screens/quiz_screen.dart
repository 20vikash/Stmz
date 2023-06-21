import 'package:flutter/material.dart';
import 'package:stem_quiz/widgets/quiz_sheet.dart';

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
              showModalBottomSheet(
                context: context,
                builder: (ctx) => const QuizSheet(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
