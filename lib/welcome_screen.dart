import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ghumfir/register_screen.dart';
import 'package:ghumfir/user.dart';
import 'package:http/http.dart' as http;
import 'package:ghumfir/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final userid = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

  void clearText() {
    password.clear();
  }

  Future getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? stringValue = prefs.getString('key');
      if(stringValue != null){
        Navigator.pushNamed(context, HomeScreen.id);
      }
    });
  }
  @override
  void initState() {
      getAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFC5F4DF),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(tag: 'logo', child: Container(
                        child: Image.asset('images/Icon_adobespark.png'),
                        height: 200.0,
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
                        controller: userid,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
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
                        controller: password,
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
                      ElevatedButton(onPressed: () {
                        login().then((value) => userData());
                        clearText();
                        // Timer(Duration(seconds: 3), () {
                        //   userData();
                        // });
                      },
                        child: Text('LogIn'),
                        style: ElevatedButton.styleFrom(fixedSize: Size(200.0, 50.0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                        ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text('Not a User?',),
                          TextButton(onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          }, child: Text('Register', style: TextStyle(color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

Future login() async {
    try {
      if (userid.text.isNotEmpty &&
          password.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse(
                "http://ghumfir003.pythonanywhere.com/api/auth/login/"),
            body: ({
              "username": userid.text,
              "password": password.text,
            }));
        if (response.statusCode == 200) {
          String data = response.body;
          var decodeData = json.decode(data);
          print(decodeData);
          print(decodeData["key"]);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            prefs.setString("key", decodeData['key']);
          });
          Navigator.pushNamed(context, HomeScreen.id);
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid Credentials')));
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fill all the Fields')));
      }
    }
    catch(e) {
      print(e);
    }
}
}