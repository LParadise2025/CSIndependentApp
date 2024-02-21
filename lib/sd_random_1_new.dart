import 'package:cs_independent_project/sd_random_2_new.dart';
import 'package:cs_independent_project/sd_random_last_participant.dart';
import 'package:cs_independent_project/sd_random_last_participant_new.dart';
import 'package:cs_independent_project/sd_simple_2_new.dart';
import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_vote_new.dart';

class sd_random_1_new extends StatelessWidget {
  final TextEditingController _solution1 = TextEditingController();
  final TextEditingController _solution2 = TextEditingController();
  final TextEditingController _solution3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Decision",
          style: TextStyle(
            color: Colors.pink, // Neon pink color
          ),
        ),
        backgroundColor: Colors.black, // Black background color
        shape: Border(bottom: BorderSide(color: Colors.pink, width: 2)), // Pink border
      ),
      backgroundColor: Colors.black, // Set the background color of the body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              int numParticipants = appState.numParticipants;
              int currentParticipant = appState.currentParticipant;

              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
               
                      const Text(
                        'Type Your Proposed Solutions Below',
                        style: TextStyle(color: Colors.pink), // Neon pink color
                      ),
                      TextField(
                        controller: _solution1,
                        style: TextStyle(color: Colors.pink), // Neon pink color
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink, // Pink color
                            ),
                          ),
                          hintText: 'Enter A Solution',
                          hintStyle: TextStyle(color: Colors.yellow), // Light grey color
                        ),
                      ),
                      TextField(
                        controller: _solution2,
                        style: TextStyle(color: Colors.pink), // Neon pink color
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink, // Pink color
                            ),
                          ),
                          hintText: 'Enter A Solution',
                          hintStyle: TextStyle(color: Colors.yellow), // Light grey color
                        ),
                      ),
                      TextField(
                        controller: _solution3,
                        style: TextStyle(color: Colors.pink), // Neon pink color
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink, // Pink color
                            ),
                          ),
                          hintText: 'Enter A Solution',
                          hintStyle: TextStyle(color: Colors.yellow), // Light grey color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_solution1.text.isNotEmpty) {
                            Set<String> newSolutions = {_solution1.text};
                            appState.updateSolutionList(newSolutions);
                          }
                          if (_solution2.text.isNotEmpty) {
                            Set<String> newSolutions = {_solution2.text};
                            appState.updateSolutionList(newSolutions);
                          }
                          if (_solution3.text.isNotEmpty) {
                            Set<String> newSolutions = {_solution3.text};
                            appState.updateSolutionList(newSolutions);
                          }

                          // Navigate based on the number of participants
                          if (currentParticipant >= numParticipants) {
                             appState.updateCurrentParticipant();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_random_last_participant_new(),
                              ),
                            );
                          } else {
                            appState.updateCurrentParticipant();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_random_2_new(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow, // Yellow background color
                          side: BorderSide(color: Colors.pink, width: 2), // Pink border
                        ),
                        child: const Text(
                          'Next Person',
                          style: TextStyle(color: Colors.pink), // Neon pink color
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

  @override
  void dispose() {
    // Dispose of controllers when they are no longer needed
    _solution1.dispose();
    _solution2.dispose();
    _solution3.dispose();

  }
}
