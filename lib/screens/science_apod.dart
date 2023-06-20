import 'package:flutter/material.dart';
import 'package:stem_quiz/models/api_data.dart';

class ScienceApod extends StatefulWidget {
  const ScienceApod({super.key});

  @override
  State<ScienceApod> createState() => _ScienceApodState();
}

class _ScienceApodState extends State<ScienceApod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
