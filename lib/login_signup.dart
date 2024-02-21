import 'package:flutter/material.dart';

class login_signup extends StatelessWidget{
   login_signup({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('log in / sign up home')
      ),
      body: const Center(
        child: Column(
          children: [
          Text('login / Sign up page'), 
          Text('username box'), 
          Text('password box'), 
          Text('log in button'), 
          ],
        ),
      ),
    );
  }
}