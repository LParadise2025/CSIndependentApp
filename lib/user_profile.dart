import 'package:flutter/material.dart';

class user_profile extends StatelessWidget{
   user_profile({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user profile')
      ),
      body: const Column(
        children: [
        Text('username and profile picture, clicking on the profile picture bring you to the switch users page'), 
        Text('Criteria and preferences: graphics showing what the users preference is and how strongly they feel about it'), 
        Text('button to update criteria and preferences'), 
        Text('solutions: shows how well solutions match your preferences'),
        Text('buttons across the bottom for single and multi device decisions, option to enter a code, or to enter the settings page'), 
        ],
      ),
    );
  }
}