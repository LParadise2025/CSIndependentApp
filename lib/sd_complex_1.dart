import 'package:flutter/material.dart';

class sd_complex_1 extends StatelessWidget{
  final String decisionTitle; 
  final int numMembers; 
  Set<String> solutions; 
  int participantNumber; 
   sd_complex_1({super.key, required this.decisionTitle, required this.numMembers, required this.solutions, required this.participantNumber}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(decisionTitle)
      ),
      body: Column(
        children: [
        const Text('sd complex 1'),
        Text('Participant Number: $participantNumber'),
        Text(numMembers.toString()), 
        ],
      ),
    );
  }
}