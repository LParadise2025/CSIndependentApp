import 'package:flutter/material.dart';
//add text for this page, add a counter to make it go back the right nuber of times, eventually send it to the solution page where it calculates the most popular one 

class sd_simple_between_vote extends StatelessWidget{
  final String decisionTitle;
  final int numMembers;
  Set<String> solutions;
  int participantNumber;
  Map sliderValues; 

  sd_simple_between_vote({Key? key,
      required this.decisionTitle,
      required this.numMembers,
      required this.solutions,
      required this.participantNumber, 
      required this.sliderValues
      }); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sd simple between vote')
      ),
      body: Center(
 
      ),
    );
  }
}