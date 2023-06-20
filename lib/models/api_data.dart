import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stem_quiz/screens/science_apod.dart';

String explanation = "";
String date = "";
String title = "";
String imageURL = "";
String mediaType = "";

List<Map<dynamic, dynamic>> cache = [];

fetchData(BuildContext context) async {
  if (cache.isEmpty) {
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

    final tempCache = {};
    tempCache["explanation"] = explanation;
    tempCache["date"] = date;
    tempCache["title"] = title;
    tempCache["imageURL"] = imageURL;
    tempCache["mediaType"] = mediaType;

    if (!(cache.contains(tempCache))) {
      cache.add(tempCache);
    }
  }
  else {
    explanation = cache[0]["explanation"];
    date = cache[0]["date"];
    title = cache[0]["title"];
    imageURL = cache[0]["imageURL"];
    mediaType = cache[0]["mediaType"];
  }

  if (context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ScienceApod(),
      ),
    );
  }
}
