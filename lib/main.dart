import 'package:flutter/material.dart';
import 'AppState.dart';
import 'package:provider/provider.dart';
import 'enter_code.dart';
import 'login_signup.dart';
import 'md_home.dart';
import 'sd_home_new.dart';
import 'user_profile.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Title',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Title',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => md_home(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  side: BorderSide(color: Colors.yellow, width: 2),
                ),
                child: const Text(
                  'multi-device decision',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sd_home_new(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  side: BorderSide(color: Colors.yellow, width: 2),
                ),
                child: const Text(
                  'single device decision',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login_signup(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  side: BorderSide(color: Colors.yellow, width: 2),
                ),
                child: const Text(
                  'log in / sign up',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => user_profile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  side: BorderSide(color: Colors.yellow, width: 2),
                ),
                child: const Text(
                  'view profile',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => enter_code(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  side: BorderSide(color: Colors.yellow, width: 2),
                ),
                child: const Text(
                  'enter a code',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
