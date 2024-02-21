import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_vote_new.dart';

class sd_simple_between_vote_new extends StatelessWidget {
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
        automaticallyImplyLeading: false, // Remove the back arrow
        shape: Border(
          bottom: BorderSide(
            color: Colors.yellow, // Yellow border color
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
              int numParticipants = appState.numParticipants;
              int currentParticipant = appState.currentParticipant;
              String decisionTitle = appState.ASdecisionTitle;
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text("Current Participant:  $currentParticipant"),
                      const Text(
                        'Your votes have been collected. Click Continue and pass the device to the next person.',
                        style: TextStyle(
                          color: Colors.pink, // Neon pink text color
                        ),
                      ),
                      SizedBox(height: 16), // Added some space
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sd_simple_vote_new(),
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
                        child: const Text(
                          'Continue',
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
