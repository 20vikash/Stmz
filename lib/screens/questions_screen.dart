import 'package:flutter/material.dart';
import 'package:stem_quiz/screens/result_screen.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.quizData});

  final List quizData;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String answerOption = "A";
  int count = 0;
  int score = 0;
  List summary = [];

  summaryData() {
    Map tempSummary = {};
    tempSummary["question_index"] = count - 1;
    tempSummary["question"] = widget.quizData[count - 1]["question"];
    final String option = answerOption;
    String optionString = "";
    if (option == "A") {
      optionString = "op1";
    } else if (option == "B") {
      optionString = "op2";
    } else if (option == "C") {
      optionString = "op3";
    } else if (option == "D") {
      optionString = "op4";
    }

    tempSummary["user_answer"] = widget.quizData[count - 1][optionString];

    final String answer = widget.quizData[count - 1]["answer"];
    String answerString = "";
    if (answer == "A") {
      answerString = "op1";
    } else if (answer == "B") {
      answerString = "op2";
    } else if (answer == "C") {
      answerString = "op3";
    } else if (answer == "D") {
      answerString = "op4";
    }
    tempSummary["correct_answer"] = widget.quizData[count - 1][answerString];

    summary.add(tempSummary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.quizData[5]["title"],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 18,
          top: 68,
        ),
        child: ListView(
          children: [
            Text(
              widget.quizData[count]["question"],
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            const SizedBox(height: 30),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                      icon: const Icon(Icons.question_answer),
                      label: Text(
                        widget.quizData[count]["op1"],
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                      icon: const Icon(Icons.question_answer),
                      label: Text(
                        widget.quizData[count]["op2"],
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                      icon: const Icon(Icons.question_answer),
                      label: Text(
                        widget.quizData[count]["op3"],
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                      icon: const Icon(Icons.question_answer),
                      label: Text(
                        widget.quizData[count]["op4"],
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
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
                    onPressed: () {
                      count++;
                      if (answerOption ==
                          widget.quizData[count - 1]["answer"]) {
                        score += 3;
                      }

                      if (count == 5) {
                        summaryData();
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Result(
                              summaryData: summary,
                              score: score,
                              docID: widget.quizData[5]["docID"],
                            ),
                          ),
                        );
                      } else {
                        summaryData();

                        setState(() {
                          answerOption = "A";
                        });
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
