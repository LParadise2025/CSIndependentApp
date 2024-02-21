import 'package:cs_independent_project/random_solution.dart';
import 'package:cs_independent_project/sd_simple_vote.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class sd_simple_last_solution extends StatelessWidget {
  final String decisionTitle;
  final int numMembers;
  Set<String> solutions;
  int participantNumber;

  sd_simple_last_solution(
      {Key? key,
      required this.decisionTitle,
      required this.numMembers,
      required this.solutions,
      required this.participantNumber, 
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(decisionTitle)),
      body: Column(
        children: [
          Text('sd simple last solution '),
          Text( 'NOT SUPPOSED TO BE HERE'),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sd_simple_vote(
                      decisionTitle: decisionTitle,
                      numMembers: numMembers,
                      solutions: solutions,
                      participantNumber: participantNumber,

                    ),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
