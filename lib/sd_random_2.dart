import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/random_solution.dart';
import 'package:cs_independent_project/sd_random_1.dart';
import 'package:cs_independent_project/sd_random_last_participant.dart';
import 'package:flutter/material.dart';

class sd_random_2 extends StatelessWidget{
  final String decisionTitle; 
  final int numMembers; 
  Set<String> solutions;
  int participantNumber;  

   sd_random_2({super.key, required this.decisionTitle, required this.numMembers, required this.solutions, required this.participantNumber}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(decisionTitle)
      ),
      body: Column(
        children: [
        const Text('sd random 2'),
        Text(numMembers.toString()), 
        const Text('Your solutions have been recorded. Pass the device to the next participant. '),
       
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {

                if(participantNumber <= numMembers){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sd_random_1(decisionTitle: decisionTitle, numMembers: numMembers, solutions: solutions, participantNumber: participantNumber,),
                  ),
                );}
                else{
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sd_random_last_participant(decisionTitle: decisionTitle, numMembers: numMembers, solutions: solutions, participantNumber: participantNumber,),
                  ),
                );
                }
              },
              child: const Text('Continue'),
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