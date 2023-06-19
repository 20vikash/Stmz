import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const Text("Stem Quiz"),
          const Text("Login"),
          TextField(
            controller: emailC,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          TextField(
            controller: emailC,
            decoration: const InputDecoration(
              hintText: "Your Password",
              prefixIcon: Icon(Icons.password)
            ),
          ),
        ],
      ),
    );
  }
}
