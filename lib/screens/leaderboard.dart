import 'package:flutter/material.dart';
import 'package:stem_quiz/models/meta_data.dart';
import 'package:stem_quiz/widgets/btm_nav.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key, required this.leaders});

  final List leaders;

  @override
  Widget build(BuildContext context) {
    btmNavint = 1;

    return Scaffold(
      bottomNavigationBar: const BtmNav(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Leader Board",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: leaders.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text(
                          ((leaders[index]['leader_index'] as int) + 1)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              leaders[index]['userName'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Score: ${leaders[index]['score'].toString()}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 191, 90, 214),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
