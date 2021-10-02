import 'package:flutter/material.dart';
import 'package:ghumfir/first_screen.dart';
import 'package:ghumfir/home_screen.dart';
import 'package:ghumfir/interesteduser_screen.dart';
import 'package:ghumfir/recommended.dart';
import 'package:ghumfir/register_screen.dart';
import 'package:ghumfir/interest_screen.dart';
import 'package:ghumfir/kyc_screen.dart';
import 'getKYC.dart';
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
        navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id : (context) => WelcomeScreen(),
          RegisterScreen.id : (context) => RegisterScreen(),
          FirstScreen.id : (context) => FirstScreen(),
          HomeScreen.id : (context) => HomeScreen(),
          InterestScreen.id : (context) => InterestScreen(),
          Recommended.id : (context) => Recommended(),
          KycScreen.id : (context) => KycScreen(),
          InterestedUser.id: (context) => InterestedUser(),
        }
    );
  }
}