import 'package:cs_independent_project/random_solution.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class sd_random_last_participant extends StatelessWidget {
  final String decisionTitle;
  final int numMembers;
  Set<String> solutions;
  int participantNumber;

  sd_random_last_participant(
      {Key? key,
      required this.decisionTitle,
      required this.numMembers,
      required this.solutions,
      required this.participantNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String theSolution =
        solutions.elementAt(Random().nextInt(solutions.length));

    return Scaffold(
      appBar: AppBar(title: Text(decisionTitle)),
      body: Column(
        children: [
          Text('sd random last participant '),
          Text(
              'All members have added their solutions. Click continue to see your solution.'),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => random_solution(
                      decisionTitle: decisionTitle,
                      numMembers: numMembers,
                      solutions: solutions,
                      participantNumber: participantNumber,
                      theSolution: theSolution,
                    ),
                  ),
                );
              },
              child: const Text('See your solution.'),
            ),
          ),
        ],
      ),
    );
  }
}
