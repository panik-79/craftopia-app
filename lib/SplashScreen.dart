import 'package:flutter/material.dart';
import 'HomePage.dart';

import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Delay for 3 seconds
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to HomePage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to your preferred background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg', height: 150, width: 150), // Your logo
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change color if needed
            ),
          ],
        ),
      ),
    );
  }
}