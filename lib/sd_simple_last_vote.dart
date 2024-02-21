import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_view_solution.dart';

class sd_simple_last_vote extends StatelessWidget {
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
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All members have voted. Click continue to see your solution.',
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
                              builder: (context) => sd_simple_view_solution(),
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
