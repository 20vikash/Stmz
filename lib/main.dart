import 'package:flutter/material.dart';
import 'package:stem_quiz/auth.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 242, 172, 66),
);

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: const Auth(),
      theme: ThemeData(useMaterial3: true, colorScheme: colorScheme),
    ),
  );
}
