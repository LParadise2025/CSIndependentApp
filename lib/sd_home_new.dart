import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppState.dart';
import 'sd_random_1_new.dart';
import 'sd_simple_1_new.dart';

class sd_home_new extends StatefulWidget {
  @override
  State<sd_home_new> createState() => _sd_home_newState();
}

class _sd_home_newState extends State<sd_home_new> {
  final TextEditingController _decisionTitleTEC = TextEditingController();

  final numMembers = ["1", "2", "3", "4", "5"];
  String selectedNum = "1";

  final decisionTypes = ["random", "simple"];
  String selectedType = "random";

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
            color: Colors.yellow, // Yellow border color
            width: 2,
          ),
        ),
          automaticallyImplyLeading: false, 
      ),
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
                   //   Text("Current Participant:  $currentParticipant"),
                      TextField(
                        controller: _decisionTitleTEC,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Title Your Decision',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Select the number of participants"),
                      DropdownButton<String>(
                        value: selectedNum,
                        items: numMembers
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedNum = item.toString()),
                      ),
                      const SizedBox(height: 20),
                      Text('Select what type of decision you would like to make.'),
                      DropdownButton<String>(
                        value: selectedType,
                        items: decisionTypes
                            .map(
                              (type) => DropdownMenuItem<String>(
                                value: type,
                                child: Text(
                                  type,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (type) =>
                            setState(() => selectedType = type.toString()),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          appState.setNumParticipants(int.parse(selectedNum));
                          appState.setDecisionTitle(selectedType);

                          if (selectedType == 'simple') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_simple_1_new(),
                              ),
                            );
                          } else if (selectedType == 'random') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sd_random_1_new(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink, // Pink background color
                          side: BorderSide(
                            color: Colors.yellow, // Yellow border color
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          'Submit',
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
