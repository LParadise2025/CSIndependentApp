import 'package:flutter/material.dart';

class md_home extends StatelessWidget{
   md_home({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('md home')
      ),
      body: const Column(
        children: [
        Text('code/link'), 
        Text('Title Decision and text box'), 
        Text('options for random, simple, or complex decisions'), 
        Text('Instructions'),
        Text('make decision button'), 
        Text('exit decision button'),
        ],
      ),
    );
  }
}