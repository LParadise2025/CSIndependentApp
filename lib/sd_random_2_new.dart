import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/sd_random_1_new.dart';
import 'package:cs_independent_project/sd_simple_1_new.dart';
import 'package:cs_independent_project/sd_simple_2.dart';
import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';

// make method to save solutions from all aprticipants in app state

class sd_random_2_new extends StatelessWidget {
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
                      Text("Current Participant:  $currentParticipant"),
                      const Text(
                          'Your solutions have been recorded. Click continue then pass the device to the next participant. '),
                      Builder(
                        builder: (context) => ElevatedButton(
                          onPressed: () {
// eventually this should be moved back so that you don't get shown the middle screen after the last participant

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_random_1_new(),
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
