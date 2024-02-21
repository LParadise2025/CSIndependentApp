import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  int numParticipants = 1;
  int currentParticipant = 1;
  String ASdecisionTitle = "My Decision";
  Set<String> solutions = {};
  String? theSolution;
  Map<String, double> netSliderValues = {};

  void setDecisionTitle(String? decisionTitle) {
    if (decisionTitle != null) {
      ASdecisionTitle = decisionTitle;
      notifyListeners();
    }
  }

  void setNumParticipants(int? numPar) {
    if (numPar != null) {
      numParticipants = numPar;
      notifyListeners();
    }
  }

  void updateSolutionList(Set<String> newSolutions) {
    if (newSolutions.isNotEmpty) {
      solutions.addAll(newSolutions);
      notifyListeners();
    }
  }

  void updateNetSliderValues(Map<String, double> newSliderValues) {
    if (newSliderValues.isNotEmpty) {
      newSliderValues.forEach((solution, value) {
        netSliderValues[solution] = (netSliderValues[solution] ?? 0.0) + value;
      });
      notifyListeners();
    }
  }

  void updateCurrentParticipant() {
    currentParticipant += 1;
  }

  void printNetSliderValues() {
    print('Net Slider Values:');
    netSliderValues.forEach((solution, value) {
      print('$solution: $value');
    });
  }



void resetAppState() {
  print('Before reset:');
  print('numParticipants: $numParticipants');
  print('currentParticipant: $currentParticipant');
  print('ASdecisionTitle: $ASdecisionTitle');
  print('solutions: $solutions');
  print('theSolution: $theSolution');
  print('netSliderValues: $netSliderValues');

  numParticipants = 1;
  currentParticipant = 1;
  ASdecisionTitle = "My Decision";
  solutions.clear();
  solutions = {};
  theSolution = " ";
  netSliderValues.clear();
  netSliderValues = {}; 

  print('After reset:');
  print('numParticipants: $numParticipants');
  print('currentParticipant: $currentParticipant');
  print('ASdecisionTitle: $ASdecisionTitle');
  print('solutions: $solutions');
  print('theSolution: $theSolution');
  print('netSliderValues: $netSliderValues');

  notifyListeners();
}

}
