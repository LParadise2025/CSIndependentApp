import 'package:cs_independent_project/sd_simple_between_vote.dart';
import 'package:flutter/material.dart';

// all of the elements of the solutions Set should be displayed
// users should be able to rank them from most to least preferred (maube using a slider?)
// these numerical scores need to be saved (to an array list?), more "points " is a better score
// as each participant come to this page, thier new scores are added on top of the existing ones
// the set must be passed forward so that it can be updated by later participants
// at the end, the set element with the highest score will be returned
// if there is a tie, the user will be alerted
// flipping coin animation to show which one wins?

// in theory each slider should have an index in the sliderValues Map

class sd_simple_vote extends StatefulWidget {
  final String decisionTitle;
  final int numMembers;
  Set<String> solutions;
  int participantNumber;
  Map<String, double> netSliderValues = {};

  sd_simple_vote(
      {Key? key,
      required this.decisionTitle,
      required this.numMembers,
      required this.solutions,
      required this.participantNumber})
      : super(key: key);

  @override
  State<sd_simple_vote> createState() => _sd_simple_voteState();
}

class _sd_simple_voteState extends State<sd_simple_vote> {
  Map<String, double> sliderValues = {};

  @override
  void initState() {
    super.initState();
    for (var solution in widget.solutions) {
      sliderValues[solution] = 0.0;
      widget.netSliderValues[solution] =0.0; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sd simple vote ')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.solutions.length,
              itemBuilder: (context, index) {
                String solution = widget.solutions.elementAt(index);
                return buildSlider(solution);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              saveSliderValues();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sd_simple_between_vote(
                      decisionTitle: widget.decisionTitle,
                      numMembers: widget.numMembers,
                      solutions: widget.solutions,
                      participantNumber: widget.participantNumber,
                      sliderValues: sliderValues),
                ),
              );
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget buildSlider(String solution) {
    return Column(
      children: [
        Text(solution),
        Slider(
          value: sliderValues[solution]!,
          onChanged: (double value) {
            setState(() {
              sliderValues[solution] = value;
            });
          },
          min: 0,
          max: 10,
          divisions: 100,
          label: sliderValues[solution]!.round().toString(),
        ),
      ],
    );
  }

  void saveSliderValues() {
  sliderValues.forEach((key, value) {
    if (widget.netSliderValues.containsKey(key)) {
      widget.netSliderValues[key] = (widget.netSliderValues[key] ?? 0.0) + value;
    } else {
      widget.netSliderValues[key] = value;
    }
  });
}





}