import 'package:flutter/material.dart';

class ToBeCon extends StatelessWidget {
  const ToBeCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Pending work....",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Text(
            "Will be updated.. Stay tuned!!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35,
                color: Colors.black.withOpacity(0.85),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
