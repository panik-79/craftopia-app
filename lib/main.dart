import 'package:craftopia/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SplashScreen.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
const MyApp({super.key});
@override
  State<MyApp> createState()=>_MyAppState();


}

class _MyAppState extends State<MyApp>{
  User? user;
  @override
  void initState(){
    super.initState();
    user=FirebaseAuth.instance.currentUser;

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth UI Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: user!=null ? HomePage() :LoginPage(), // Assuming you want to use SplashScreen as the initial screen
    );
  }

  
}
