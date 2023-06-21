import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String answerOption = "A";

  @override
  Widget build(BuildContext context) {
    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;

    final op1C = TextEditingController();
    final op2C = TextEditingController();
    final op3C = TextEditingController();
    final op4C = TextEditingController();
    final questionC = TextEditingController();

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
                      iconEnabledColor:
                          Theme.of(context).colorScheme.primaryContainer,
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
                    onPressed: () {},
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
