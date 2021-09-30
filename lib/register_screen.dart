import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ghumfir/home_screen.dart';
import 'package:ghumfir/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final userid = TextEditingController();
  final email = TextEditingController();
  final password1 = TextEditingController();
  final password2 = TextEditingController();
  final first = TextEditingController();
  final last = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFC5F4DF),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Hero(tag: 'logo', child: Container(
                  child: Image.asset('images/Icon_adobespark.png'),
                  height: 180.0,
                ),
                ),
                Text(
                  'Ghumfir',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: first,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity_sharp),
                    hintText: 'first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: last,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity_sharp),
                    hintText: 'Last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: userid,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                    hintText: 'Enter your Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: password1,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: password2,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Re-enter your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(onPressed: () {
                  register().then((value) => userData());
                  // Timer(Duration(seconds: 3), () {
                  //   userData();
                  // });
                },
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(fixedSize: Size(200.0, 50.0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                  ),
                  ),
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
      var response = await http.post(
          Uri.parse(
              "http://ghumfir002.pythonanywhere.com/api/auth/register/"),
          body: ({
            "username": userid.text,
            "email": email.text,
            "password1": password1.text,
            "password2": password2.text,
            "first_name": first.text,
            "last_name": last.text,
          }));
      if (response.statusCode == 201) {
        String data = response.body;
        var decodeData = json.decode(data);
        print(data);
        Navigator.pushNamed(context, HomeScreen.id);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          prefs.setString("key", decodeData['key']);
        });
      }
  }
    }
