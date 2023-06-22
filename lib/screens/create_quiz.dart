import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key, required this.catg});

  final String catg;

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String answerOption = "A";
  int count = 0;
  List quizData = [];
  Map tempData = {};
  final op1C = TextEditingController();
  final op2C = TextEditingController();
  final op3C = TextEditingController();
  final op4C = TextEditingController();
  final questionC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Create Quiz",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 18,
          top: keyBoardHeight > 0 ? 0 : 68,
        ),
        child: ListView(
          children: [
            TextField(
              controller: questionC,
              decoration: const InputDecoration(
                hintText: "Your Question",
                prefixIcon: Icon(Icons.question_answer),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      controller: op1C,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Option 1",
                          prefixIcon: const Icon(Icons.input)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      controller: op2C,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Option 2",
                          prefixIcon: const Icon(Icons.input)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      controller: op3C,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Option 3",
                          prefixIcon: const Icon(Icons.input)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      controller: op4C,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Option 4",
                          prefixIcon: const Icon(Icons.input)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: DropdownButton(
                      underline: Container(
                        height: 3,
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer, //<-- SEE HERE
                      ),
                      dropdownColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      value: answerOption,
                      items: const [
                        DropdownMenuItem(
                          value: "A",
                          child: Text(
                            "A",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "B",
                          child: Text(
                            "B",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "C",
                          child: Text(
                            "C",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "D",
                          child: Text(
                            "D",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          answerOption = value!;
                        });
                      },
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (questionC.text.trim().isNotEmpty &&
                          op1C.text.trim().isNotEmpty &&
                          op2C.text.trim().isNotEmpty &&
                          op3C.text.trim().isNotEmpty &&
                          op4C.text.trim().isNotEmpty) {
                        if (count < 4) {
                          count++;
                          tempData = {};

                          tempData["question"] = questionC.text;
                          tempData["op1"] = op1C.text;
                          tempData["op2"] = op2C.text;
                          tempData["op3"] = op3C.text;
                          tempData["op4"] = op4C.text;
                          tempData["answer"] = answerOption;

                          quizData.add(tempData);

                          setState(() {
                            questionC.clear();
                            op3C.clear();
                            op4C.clear();
                            op1C.clear();
                            op2C.clear();

                            answerOption = "A";
                          });
                        } else {
                          tempData = {};

                          tempData["question"] = questionC.text;
                          tempData["op1"] = op1C.text;
                          tempData["op2"] = op2C.text;
                          tempData["op3"] = op3C.text;
                          tempData["op4"] = op4C.text;
                          tempData["answer"] = answerOption;

                          quizData.add(tempData);

                          final userNameDoc = await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get();
                          final userName = userNameDoc.data()!["userName"];

                          quizData.add({
                            'createdAt': Timestamp.now(),
                            'title': widget.catg,
                            'userID': FirebaseAuth.instance.currentUser!.uid,
                            'userName': userName,
                          });

                          await FirebaseFirestore.instance
                              .collection("quiz")
                              .add(
                            {
                              "quizList": quizData,
                            },
                          );

                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            'score': FieldValue.increment(10),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.errorContainer,
                            content: Text(
                              "Please provide complete data",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer),
                            ),
                          ),
                        );
                      }
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
            ),
          ],
        ),
      ),
    );
  }
}
