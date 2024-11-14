
import 'package:famous_prvinces/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';



void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image(
              image: AssetImage('assets/map.jpg'),
              height: 220,
            ),
            SizedBox(height: 20),
            Text(
              'ولایات مشهور افغانستان',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              'V 0.1.1',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 25),
            CupertinoActivityIndicator(
              color: Color.fromARGB(255, 180, 158, 158),
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
