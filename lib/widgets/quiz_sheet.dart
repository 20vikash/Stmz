import 'package:flutter/material.dart';

import 'package:stem_quiz/screens/create_quiz.dart';

class QuizSheet extends StatefulWidget {
  const QuizSheet({super.key});

  @override
  State<QuizSheet> createState() => _QuizSheetState();
}

class _QuizSheetState extends State<QuizSheet> {
  String quizOp = "Science";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your subject",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton(
                  underline: Container(
                    height: 3,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer, //<-- SEE HERE
                  ),
                  dropdownColor: Theme.of(context).colorScheme.primaryContainer,
                  value: quizOp,
                  items: const [
                    DropdownMenuItem(
                      value: "Science",
                      child: Text(
                        "Science",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Technology",
                      child: Text(
                        "Technology",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Engineering",
                      child: Text(
                        "Engineering",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Maths",
                      child: Text(
                        "Maths",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      quizOp = value!;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => CreateQuiz(
                          catg: quizOp,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  label: Text(
                    "Next",
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
