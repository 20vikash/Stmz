import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stem_quiz/screens/science_apod.dart';

String explanation = "";
String date = "";
String title = "";
String imageURL = "";
String mediaType = "";

fetchData(BuildContext context) async {
  const url =
      "https://api.nasa.gov/planetary/apod?api_key=jt19cWSthC8W1CmfyD3U5FEBzqzldmhOyz0Pa3Yh";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);

  explanation = json["explanation"];
  date = json["date"];
  title = json["title"];
  imageURL = json["hdurl"];
  mediaType = json["media_type"];

  if (context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ScienceApod(),
      ),
    );
  }
}
