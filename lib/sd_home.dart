//I need to find a way to carry the Set with me through the project, however, this is hard to do because values will only be added on later pages 

import 'package:cs_independent_project/home_page.dart';
import 'package:cs_independent_project/sd_complex_1.dart';
import 'package:cs_independent_project/sd_random_1.dart';
import 'package:cs_independent_project/sd_simple_1.dart';
import 'package:flutter/material.dart';

class sd_home extends StatefulWidget {
  final Set<String> solutions = {}; 

  sd_home({super.key});

  @override
  State<sd_home> createState() => _sd_homeState();
}

class _sd_homeState extends State<sd_home> {
  final TextEditingController _decisionTitleTEC = TextEditingController();
  Set<String> solutions = {};
  int participantNumber = 1; 
  
  List<String> numMembers = ['1', '2', '3', '4', '5'];
  String selectedItem = '1';

  List<String> typeDecision = ['simple', 'random', 'complex'];
  String selectedType = 'simple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sd home')),
      body: Column(
        children: [
          const Text('Title Decision:'),
          TextField(
            controller: _decisionTitleTEC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title Your Decision',
            ),
          ),
          const Text('number of members dropdown '),
          DropdownButton<String>(
            value: selectedItem,
            items: numMembers
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 24)),
                    ))
                .toList(),
            onChanged: (item) => setState(() => selectedItem = item.toString()),
          ),
          Text('options for random, simple, or complex decisions'),
          DropdownButton<String>(
            value: selectedType,
            items: typeDecision
                .map((type) => DropdownMenuItem<String>(
                      value: type,
                      child: Text(type, style: TextStyle(fontSize: 24)),
                    ))
                .toList(),
            onChanged: (type) => setState(() => selectedType = type.toString()),
          ),
          Text('Instructions'),
          Text('make decision button'),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                String _decisionTitle = _decisionTitleTEC.text;

                if (selectedType == 'simple') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sd_simple_1(
                          decisionTitle: _decisionTitle,
                          numMembers: int.parse(selectedItem),
                          solutions: solutions,
                          participantNumber: participantNumber,),
                    ),
                  );
                } else if (selectedType == 'random') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sd_random_1(
                          decisionTitle: _decisionTitle,
                          numMembers: int.parse(selectedItem),
                          solutions: solutions,
                          participantNumber: participantNumber,
                          ),
                    ),
                  );
                } else if (selectedType == 'complex') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sd_complex_1(
                          decisionTitle: _decisionTitle,
                          numMembers: int.parse(selectedItem),
                          solutions: solutions,
                          participantNumber: participantNumber,),
                    ),
                  );
                }
              },
              child: const Text('Make decision'),
            ),
          ),
          SizedBox(height: 16,),
           Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => home_page(),
                    ),
                  );
                },
                child: const Text('Exit Decision'),
              ),
            ),
        ],
      ),
    );
  }
}
