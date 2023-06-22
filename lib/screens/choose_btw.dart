import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stem_quiz/models/meta_data.dart';
import 'package:stem_quiz/screens/learrning_stem.dart';
import 'package:stem_quiz/screens/quiz_screen.dart';
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
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const LearnStem(),
                      ),
                    );
                  },
                  child: const ChooseItem(
                    image: "./lib/assets/learning.jpg",
                    name: "Learning Material",
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final quizDataGet = await FirebaseFirestore.instance
                        .collection("quiz")
                        .get();

                    if (context.mounted) {
                      for (var doc in quizDataGet.docs) {
                        if (doc.data()["quizList"][5]["userID"] !=
                            FirebaseAuth.instance.currentUser!.uid) {
                          quizMetaData.add(doc.data()["quizList"]);
                          quizMetaData.last[5]["docID"] = doc.id;
                        }
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const Quiz(),
                        ),
                      );
                    }
                  },
                  child: const ChooseItem(
                    image: "./lib/assets/quiz.png",
                    name: "Play Quiz",
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
