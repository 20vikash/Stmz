import 'package:flutter/material.dart';
import 'package:stem_quiz/card.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: 80 + keyboardHeight),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.create, size: 28),
            ],
          ),
          SizedBox(height: 20),
          CardWid(
            authString: "Sign Up",
          ),
        ],
      ),
    );
  }
}
