import 'package:cs_independent_project/sd_random_last_participant.dart';
import 'package:cs_independent_project/sd_simple_2_new.dart';
import 'package:cs_independent_project/sd_random_view_solution.dart';
import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_vote_new.dart';

class sd_random_last_participant_new extends StatelessWidget {
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
               Text("All participants have added their solutions. Click continue to see which one is selected!", style: TextStyle(
            color: Colors.pink, // Neon pink color
          ),),
                      ElevatedButton(
                        onPressed: () {
                      

                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_random_view_solution(),
                              ),
                            );
                        
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow, // Yellow background color
                          side: BorderSide(color: Colors.pink, width: 2), // Pink border
                        ),
                        child: const Text(
                          'See Solution',
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


}
