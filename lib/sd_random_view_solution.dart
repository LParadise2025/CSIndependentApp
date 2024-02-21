import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppState.dart';

class sd_random_view_solution extends StatefulWidget {
  @override
  _sd_random_view_solutionState createState() =>
      _sd_random_view_solutionState();
}

class _sd_random_view_solutionState extends State<sd_random_view_solution> {
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
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
      backgroundColor: Colors.black, // Set the background color of the body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              Set<String> solutions = appState.solutions;

              // Generate a random index between 0 and the number of elements in solutions
              Random random = Random();
              int randomIndex = random.nextInt(solutions.length);

              // Get the element at the random index
              String randomSolution = solutions.elementAt(randomIndex);

              // Trigger confetti animation
              _controller.play();

              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow,
                          border: Border.all(
                            color: Colors.pink, // Pink outline color
                            width: 2, // Outline width
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            "The solution is: $randomSolution",
                            style: const TextStyle(
                              color: Colors.pink, // Neon pink color
                              fontSize: 24, // Larger font size
                            ),
                            textAlign: TextAlign.center, // Center align text
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
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
                              color: Colors.pink, width: 2), // Pink border
                        ),
                        child: const Text(
                          'See Solution',
                          style:
                              TextStyle(color: Colors.pink), // Neon pink color
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

// make a button to randomize again or to send back to the home page
// in the future make an option to save the users solution 
// option to share via text? 