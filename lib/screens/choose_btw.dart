import 'package:flutter/material.dart';
import 'package:stem_quiz/widgets/choose_item.dart';

class ChooseBetween extends StatelessWidget {
  const ChooseBetween({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Column(children: [
        Text(
          "Choose",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: ListView(
              children: const [
                ChooseItem(
                  image: "./lib/assets/learning.jpg",
                  name: "Learning Material",
                ),
                ChooseItem(
                  image: "./lib/assets/quiz.png",
                  name: "Play Quiz",
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
