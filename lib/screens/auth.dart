import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stem_quiz/card.dart';
import 'package:stem_quiz/register_sheet.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: keyBoardHeight == 0 ? 120 : 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.science,
                  size: 50,
                  color: Colors.orange.withOpacity(0.75),
                ),
                Text(
                  "Stmz",
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
                  color: Colors.orange.withOpacity(0.75),
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
            const Padding(
                padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: CardWid(authString: "Sign in")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useRootNavigator: false,
                      context: context,
                      builder: (ctx) => const Register(),
                    );
                  },
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
