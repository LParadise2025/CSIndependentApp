import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'sd_simple_last_vote.dart';
import 'sd_simple_between_vote_new.dart';

class sd_simple_vote_new extends StatefulWidget {
  @override
  State<sd_simple_vote_new> createState() => _sd_simple_vote_newState();
}

class _sd_simple_vote_newState extends State<sd_simple_vote_new> {
  late Map<String, double> sliderValues;

  @override
  void initState() {
    super.initState();
    // Retrieve the solutions set from the appState
    Set<String> solutions =
        Provider.of<AppState>(context, listen: false).solutions;

    // Initialize slider values in initState
    sliderValues = {};
    for (var solution in solutions) {
      sliderValues[solution] = 0.0;
    }
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
              int numParticipants = appState.numParticipants;
              int currentParticipant = appState.currentParticipant;
              String decisionTitle = appState.ASdecisionTitle;
              Set<String> solutions = appState.solutions;

              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: solutions.length,
                      itemBuilder: (context, index) {
                        String solution = solutions.elementAt(index);
                        return buildSlider(solution);
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        saveSliderValues(appState);

                        if (currentParticipant >= numParticipants * 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sd_simple_last_vote(),
                            ),
                          );
                        } else {
                          appState.updateCurrentParticipant();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  sd_simple_between_vote_new(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        side: BorderSide(
                          color: Colors.pink,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

Widget buildSlider(String solution) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            solution,
            style: TextStyle(
              color: Colors.pink,
            ),
          ),
          Text(
            'Score: ${sliderValues[solution]?.round() ?? 0}',
            style: TextStyle(
              color: Colors.pink,
            ),
          ),
        ],
      ),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.yellow,
          thumbColor: Colors.yellow,
          overlayColor: Colors.yellow.withOpacity(0.3),
          valueIndicatorColor: Colors.yellow,
        ),
        child: Slider(
          value: sliderValues[solution] ?? 0,
          onChanged: (double value) {
            setState(() {
              sliderValues[solution] = value;
            });
          },
          min: 0,
          max: 100,
          divisions: 100,
          label: (sliderValues[solution] ?? 0).round().toString(),
        ),
      ),
    ],
  );
}

  void saveSliderValues(AppState appState) {
    appState.updateNetSliderValues(sliderValues);
    appState.printNetSliderValues();
  }
}
