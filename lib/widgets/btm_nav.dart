import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stem_quiz/models/meta_data.dart';
import 'package:stem_quiz/screens/leaderboard.dart';
import 'package:stem_quiz/screens/learrning_stem.dart';

class BtmNav extends StatefulWidget {
  const BtmNav({super.key});

  @override
  State<BtmNav> createState() => _BtmNavState();
}

class _BtmNavState extends State<BtmNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Learning",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: "LeaderBoard",
        ),
      ],
      currentIndex: btmNavint,
      onTap: (index) async {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const LearnStem(),
            ),
          );
        } else if (index == 1) {
          List leadersList = [];

          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .orderBy('score', descending: true)
              .get();
          
          List<DocumentSnapshot> documents = querySnapshot.docs;

          for (var i = 0; i < documents.length; i++) {
            Map tempMap = {};

            tempMap["userName"] = documents[i]["userName"];
            tempMap["leader_index"] = i;
            tempMap["score"] = documents[i]["score"];

            leadersList.add(tempMap);
          }

          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => LeaderBoard(leaders: leadersList),
              ),
            );
          }
        }

        setState(() {
          btmNavint = index;
        });
      },
    );
  }
}
