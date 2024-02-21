import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/random_solution.dart';
import 'package:cs_independent_project/sd_random_2.dart';
import 'package:cs_independent_project/sd_simple_2.dart';
import 'package:flutter/material.dart';

class sd_simple_1 extends StatelessWidget {
  final String decisionTitle;
  final int numMembers;
  final TextEditingController _solution1 = TextEditingController();
  final TextEditingController _solution2 = TextEditingController();
  final TextEditingController _solution3 = TextEditingController();
  Set<String> solutions = {};
  int participantNumber;
  //Set<String> solutions_List;

  sd_simple_1(
      {super.key,
      required this.decisionTitle,
      required this.numMembers,
      required this.solutions,
      required this.participantNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(decisionTitle)),
      body: Column(
        children: [
          const Text('sd simple 1 new'),
          Text('Participant Number: $participantNumber'),
          Text('Number of Participants: $numMembers'),
          const Text('Type Your Proposed Solutions Below'),
          TextField(
            controller: _solution1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter A Solution',
            ),
          ),
          TextField(
            controller: _solution2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter A Solution',
            ),
          ),
          TextField(
            controller: _solution3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter A Solution',
            ),
          ),
          const Text('button to submit for the next person'),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                if (_solution1.text.isNotEmpty) {
                  solutions.add(_solution1.text);
                }
                if (_solution2.text.isNotEmpty) {
                  solutions.add(_solution2.text);
                }
                if (_solution3.text.isNotEmpty) {
                  solutions.add(_solution3.text);
                }

                participantNumber += 1;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sd_simple_2(
                      decisionTitle: decisionTitle,
                      numMembers: numMembers,
                      solutions: solutions,
                      participantNumber: participantNumber,
                    ),
                  ),
                );
              },
              child: const Text('Next Person'),
            ),
          ),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home_page(),
                  ),
                );
              },
              child: const Text('Exit Decision'),
            ),
          ),
        ],
      ),
    );
  }
}
