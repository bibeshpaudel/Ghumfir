import 'package:flutter/material.dart';
import 'package:ghumfir/first_screen.dart';
import 'package:ghumfir/home_screen.dart';
import 'package:ghumfir/register_screen.dart';
import 'package:ghumfir/interest_screen.dart';
import 'package:ghumfir/match_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id : (context) => WelcomeScreen(),
          RegisterScreen.id : (context) => RegisterScreen(),
          FirstScreen.id : (context) => FirstScreen(),
          HomeScreen.id : (context) => HomeScreen(),
          InterestScreen.id : (context) => InterestScreen(),
          MatchScreen.id : (context) => MatchScreen(),
        }
    );
  }
}