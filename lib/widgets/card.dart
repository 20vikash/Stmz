import 'package:flutter/material.dart';
import 'package:stem_quiz/models/meta_data.dart';
import 'package:stem_quiz/screens/choose_btw.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class CardWid extends StatelessWidget {
  const CardWid({super.key, required this.authString});

  final String authString;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();
    final TextEditingController userC = TextEditingController();

    return Card(
      child: Column(
        children: [
          authString == "Sign Up"
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: TextField(
                    controller: userC,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                )
              : const SizedBox(height: 0, width: 0),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: emailC,
              decoration: InputDecoration(
                  hintText: "Your email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Your Password",
                  prefixIcon: const Icon(Icons.lock)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          authString == "Sign in"
              ? ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      final _ = await _firebase.signInWithEmailAndPassword(
                        email: emailC.text,
                        password: passC.text,
                      );
                      final DocumentSnapshot doc = await FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc(_firebase.currentUser!.uid)
                          .get();

                      if (!(doc.exists)) {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(_firebase.currentUser!.uid)
                            .set(
                          {
                            'userID': _firebase.currentUser!.uid,
                            'userName': userName,
                            'score': 0,
                          },
                        );
                      }

                      if (context.mounted) {
                        emailC.clear();
                        passC.clear();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const ChooseBetween(),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.errorContainer,
                          content: Text(
                            error.message ?? "Sign in failed",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.login,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  label: Text(
                    authString,
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 30),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (EmailValidator.validate(emailC.text)) {
                          if (passC.text.trim().isNotEmpty) {
                            if (passC.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Password must be atleast 8 characters"),
                                ),
                              );
                            } else {
                              try {
                                final _ = await _firebase
                                    .createUserWithEmailAndPassword(
                                  email: emailC.text,
                                  password: passC.text,
                                );
                                if (context.mounted) {
                                  userName = userC.text;
                                  Navigator.pop(context);
                                }
                              } on FirebaseAuthException catch (error) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .errorContainer,
                                    content: Text(
                                      error.message ?? "Authentication failed.",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onErrorContainer),
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.errorContainer,
                              content: Text(
                                "Please enter valid details",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        Icons.login,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      label: Text(
                        authString,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                      label: Text(
                        "Cancel",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.errorContainer),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
