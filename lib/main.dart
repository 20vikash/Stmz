import 'package:flutter/material.dart';
import 'package:stem_quiz/auth.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: const Auth(),
      theme: ThemeData(useMaterial3: true),
    ),
  );
}
