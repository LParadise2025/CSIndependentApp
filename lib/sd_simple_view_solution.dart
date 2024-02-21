import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppState.dart';

// need to make logic for if tehre was a tie 

class sd_simple_view_solution extends StatefulWidget {
  @override
  _sd_simple_view_solutionState createState() =>
      _sd_simple_view_solutionState();
}

class _sd_simple_view_solutionState extends State<sd_simple_view_solution> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        shape: Border(
          bottom: BorderSide(
            color: Colors.pink, // Pink border
            width: 2, // Thicker border
          ),
        ),
      ),
      backgroundColor: Colors.black, // Set the background color of the body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              // Get the map of net slider values
              Map<String, double> netSliderValues = appState.netSliderValues;

              // Calculate total possible votes
              int totalVotes = appState.numParticipants * 100;

              // Find the highest voted solution and its vote count
              String? highestVotedSolution;
              double maxVotes = 0;
              netSliderValues.forEach((solution, votes) {
                if (votes > maxVotes) {
                  highestVotedSolution = solution;
                  maxVotes = votes;
                }
              });

              // Trigger confetti animation
              _controller.play();

              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConfettiWidget(
                        confettiController: _controller,
                        blastDirection:
                            pi, // Use explosive for the blast direction
                        blastDirectionality: BlastDirectionality.explosive,
                        numberOfParticles: 50, // Decrease number of particles
                        colors: const [
                          Colors.pink,
                          Colors.yellow,
                          Colors.black,
                          Colors.white,
                        ], // Customize confetti colors
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Highest Voted Solution: ${highestVotedSolution ?? 'No solutions yet'}",
                        style: TextStyle(
                          color: Colors.pink, // Neon pink text color
                        ),
                      ),
                      Text(
                        "Number of Votes: ${maxVotes.toInt()} / $totalVotes",
                        style: TextStyle(
                          color: Colors.pink, // Neon pink text color
                        ),
                      ),
                      SizedBox(height: 16), // Added some space
                      ElevatedButton(
                        onPressed: () {
                          // Reset the number of participants and current participant to 0
                          appState.resetAppState();
                  

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow, // Yellow background color
                          side: BorderSide(
                            color: Colors.pink, // Neon pink border color
                            width: 2, // Thicker border
                          ),
                        ),
                        child: Text(
                          'Back to Home',
                          style: TextStyle(
                            color: Colors.pink, // Neon pink text color
                          ),
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
