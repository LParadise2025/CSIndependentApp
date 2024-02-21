import 'package:flutter/material.dart';

class enter_code extends StatelessWidget{
   enter_code({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter a code')
      ),
      body: const Center(
        child: Column(
          children: [
          Text('text box to enter a code'), 
          Text('if the code matches one that is active, the decision title will pop up'), 
          Text('continue to decision button'), 
          Text('exit decsion button'), 
          ],
        ),
      ),
    );
  }
}