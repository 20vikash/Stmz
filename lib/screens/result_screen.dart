import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.summaryData,
    required this.score,
    required this.docID,
  });

  final List summaryData;
  final int score;
  final String docID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You scored $score points",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 500,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: 31,
                  right: 31,
                ),
                child: SingleChildScrollView(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: summaryData.map(
                          (data) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: data["user_answer"] !=
                                          data["correct_answer"]
                                      ? Theme.of(context)
                                          .colorScheme
                                          .errorContainer
                                      : Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                  foregroundColor: data["user_answer"] !=
                                          data["correct_answer"]
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onErrorContainer
                                      : Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                  child: Text(
                                    ((data['question_index'] as int) + 1)
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['question'] as String,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        data['user_answer'] as String,
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 191, 90, 214),
                                        ),
                                      ),
                                      Text(
                                        data['correct_answer'] as String,
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 56, 151, 229),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_right,
              ),
              onPressed: () async {
                final userData = await FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid).get();
                final docList = userData.data()!["docID"];
                if (docList.contains(docID)) {
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
                else {
                  docList.add(docID);
                  final userData = FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid);
                  await userData.update({
                    "docID" : docList,
                    "score" : FieldValue.increment(score),
                  });

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              label: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
