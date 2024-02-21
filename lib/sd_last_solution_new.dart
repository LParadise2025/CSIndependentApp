import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/sd_simple_1_new.dart';
import 'package:cs_independent_project/sd_simple_2.dart';
import 'package:cs_independent_project/sd_simple_vote_new.dart';
import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';

// make method to save solutions from all aprticipants in app state
// added the _new
class sd_simple_last_solution_new extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Decsion"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              int numParticipants = appState.numParticipants;
              int currentParticipant = appState.currentParticipant;
              String decisionTitle = appState.ASdecisionTitle;
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                              Text( 'All members have added their solutions. Click continue to move to the voting stage.'),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: (
                
              ) {
                print(appState.currentParticipant);
                Navigator.push(
                  context,
              
                  MaterialPageRoute(
                    builder: (context) => sd_simple_vote_new(),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ),
                   
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
