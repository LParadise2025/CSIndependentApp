import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_vote_new.dart';
import 'sd_simple_2_new.dart';

class sd_simple_1_new extends StatelessWidget {
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
            color: Colors.pink,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        shape: Border(
          bottom: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
        ),
      ),
      backgroundColor: Colors.black,
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
                      const SizedBox(height: 16.0),
                      const Text(
                        'Type Your Proposed Solutions Below',
                        style: TextStyle(color: Colors.pink),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _solution1,
                          style: TextStyle(color: Colors.pink),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow, // Yellow border
                                width: 2, // Thicker border
                              ),
                            ),
                            hintText: 'Enter A Solution',
                            hintStyle: TextStyle(color: Colors.pink), // Pink hint text
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _solution2,
                          style: TextStyle(color: Colors.pink),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            hintText: 'Enter A Solution',
                            hintStyle: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _solution3,
                          style: TextStyle(color: Colors.pink),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 20,
                              ),
                            ),
                            hintText: 'Enter A Solution',
                            hintStyle: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
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

                          if (currentParticipant >= numParticipants) {
                            appState.updateCurrentParticipant();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_simple_vote_new(),
                              ),
                            );
                          } else {
                            appState.updateCurrentParticipant();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_simple_2_new(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                          side: BorderSide(color: Colors.pink, width: 2),
                        ),
                        child: const Text(
                          'Next Person',
                          style: TextStyle(color: Colors.pink),
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
    _solution1.dispose();
    _solution2.dispose();
    _solution3.dispose();

  }
}
