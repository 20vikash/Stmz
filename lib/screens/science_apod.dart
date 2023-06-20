import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stem_quiz/models/api_data.dart';

class ScienceApod extends StatefulWidget {
  const ScienceApod({super.key});

  @override
  State<ScienceApod> createState() => _ScienceApodState();
}

class _ScienceApodState extends State<ScienceApod> {
  DateTime dateCalender = DateTime.now();

  void fetchDataAndUpdateState(
      BuildContext context, String formattedDate) async {
    await fetchData(context, formattedDate);

    setState(() {
      dateCalender = DateTime.parse(formattedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: dateCalender,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

                if (context.mounted) {
                  fetchDataAndUpdateState(context, formattedDate);
                }
              }
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ],
        centerTitle: false,
        title: const Text(
          "APOD viewer",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: imageURL != "no"
                      ? Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                        )
                      : Center(
                        child: Text(
                            "Oops..! No image for this day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                      ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.25),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        "Date : $date_",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Explanation",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.88),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 18, right: 18),
              child: Text(
                explanation,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
