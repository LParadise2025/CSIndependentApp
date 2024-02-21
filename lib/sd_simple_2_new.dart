import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_1_new.dart';

class sd_simple_2_new extends StatelessWidget {
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
         automaticallyImplyLeading: false,
        backgroundColor: Colors.black, // Black background color
        shape: Border(bottom: BorderSide(color: Colors.yellow, width: 2)), // Yellow border
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
                    /*  Text(
                        "Current Participant:  $currentParticipant",
                        style: TextStyle(color: Colors.pink), // Yellow text color
                      ),*/
                     // SizedBox(height: 20), // Add some vertical spacing
                      Text(
                        'Your solutions have been recorded. Click continue then pass the device to the next participant. ',
                        style: TextStyle(color: Colors.pink), // White text color
                      ),
                      SizedBox(height: 20), // Add some vertical spacing
                      ElevatedButton(
                        onPressed: () {
                          // Eventually this should be moved back so that you don't get shown the middle screen after the last participant
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sd_simple_1_new(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink, // Pink background color
                          side: BorderSide(color: Colors.yellow, width: 2), // Yellow border
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.yellow), // Yellow text color
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
