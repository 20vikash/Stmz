import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.science,
                  size: 50,
                  color: Colors.orange
                      .withOpacity(0.75),
                ),
                Text(
                  "Quiz",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.75),
                  ),
                ),
                Icon(
                  Icons.lightbulb_sharp,
                  size: 50,
                  color: Colors.orange
                      .withOpacity(0.75),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 10),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                        controller: passC,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Your Password",
                            prefixIcon: const Icon(Icons.password)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.login,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      label: Text(
                        "Sign in",
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
