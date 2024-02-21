import 'package:cs_independent_project/home_page.dart';
import 'package:flutter/material.dart';

class random_solution extends StatelessWidget{
  final String decisionTitle; 
  final int numMembers; 
  Set<String> solutions; 
  int participantNumber; 
  final String theSolution; 
   random_solution({super.key, required this.decisionTitle, required this.numMembers, required this.solutions, required this.participantNumber, required this.theSolution}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(decisionTitle)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('random solution: $theSolution'),
        Text('Participant Number: $participantNumber'),
       // Text(numMembers.toString()), 
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