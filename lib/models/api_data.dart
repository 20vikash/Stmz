import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stem_quiz/screens/science_apod.dart';

String explanation = "";
String date_ = "";
String title = "";
String imageURL = "";
String mediaType = "";

List<Map<dynamic, dynamic>> cache = [];
List<Map<dynamic, dynamic>> cachenull = [];

Future<bool?> fetchData(BuildContext context, String? date) async {
  if (date == null) {
    if (cachenull.isEmpty) {
      const url =
          "https://api.nasa.gov/planetary/apod?api_key=jt19cWSthC8W1CmfyD3U5FEBzqzldmhOyz0Pa3Yh";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);

      explanation = json["explanation"];
      date_ = json["date"];
      title = json["title"];
      imageURL = json["hdurl"];
      mediaType = json["media_type"];

      final tempCache = {};
      tempCache["explanation"] = explanation;
      tempCache["date"] = date_;
      tempCache["title"] = title;
      tempCache["imageURL"] = imageURL;
      tempCache["mediaType"] = mediaType;

      if (!(cachenull.contains(tempCache))) {
        cachenull.add(tempCache);
      }
    } else {
      explanation = cachenull[0]["explanation"];
      date_ = cachenull[0]["date"];
      title = cachenull[0]["title"];
      imageURL = cachenull[0]["imageURL"];
      mediaType = cachenull[0]["mediaType"];
    }

    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const ScienceApod(),
        ),
      );
    }
    return null;
  }
  else {
    var exist = false;
    for (var e in cache) {
      if (e["date"] == date) {
        exist = true;
        break;
      }
    }

    if (exist) {
      explanation = cache[0]["explanation"];
      date_ = cache[0]["date"];
      title = cache[0]["title"];
      imageURL = cache[0]["imageURL"];
      mediaType = cache[0]["mediaType"];
    }
    else {
      final url =
          "https://api.nasa.gov/planetary/apod?api_key=jt19cWSthC8W1CmfyD3U5FEBzqzldmhOyz0Pa3Yh&&date=$date";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);

      explanation = json["explanation"];
      date_ = json["date"];
      title = json["title"];
      imageURL = json["hdurl"];
      mediaType = json["media_type"];

      final tempCache = {};
      tempCache["explanation"] = explanation;
      tempCache["date"] = date_;
      tempCache["title"] = title;
      tempCache["imageURL"] = imageURL;
      tempCache["mediaType"] = mediaType;

      if (!(cache.contains(tempCache))) {
        cache.add(tempCache);
      }
    }
    return true;
  }
}
