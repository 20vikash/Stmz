import 'package:flutter/material.dart';
import 'package:stem_quiz/models/api_data.dart';
import 'package:stem_quiz/models/meta_data.dart';
import 'package:stem_quiz/screens/numbers_math.dart';
import 'package:stem_quiz/screens/tbc.dart';
import 'package:stem_quiz/widgets/btm_nav.dart';

class LearnStem extends StatelessWidget {
  const LearnStem({super.key});

  @override
  Widget build(BuildContext context) {
    final List stemList = [
      [
        const Image(
          image: AssetImage("./lib/assets/science.jpg"),
          fit: BoxFit.cover,
        ),
        "Science",
      ],
      [
        const Image(
          image: AssetImage("./lib/assets/technology.jpg"),
          fit: BoxFit.cover,
        ),
        "Technology",
      ],
      [
        const Image(
          image: AssetImage("./lib/assets/engineering.jpg"),
          fit: BoxFit.cover,
        ),
        "Engineering",
      ],
      [
        const Image(
          image: AssetImage("./lib/assets/maths.jpg"),
          fit: BoxFit.cover,
        ),
        "Maths",
      ],
    ];

    btmNavint = 0;

    return Scaffold(
      bottomNavigationBar: const BtmNav(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Subjects",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 27,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 53, bottom: 15, right: 15, left: 15),
          child: GridView.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              ...stemList.map((e) {
                return InkWell(
                  onTap: () {
                    if (e[1] == "Science") {
                      fetchData(context, null);
                    } else if (e[1] == "Maths") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const Numbers(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ToBeCon(),
                        ),
                      );
                    }
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: ClipRRect(
                          child: e[0],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          e[1],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
