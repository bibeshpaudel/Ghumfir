import 'package:flutter/material.dart';
import 'package:ghumfir/interesteduser.dart';

class InterestedUser extends StatefulWidget {
  static const id = 'interesteduser_screen';

  @override
  _InterestedUserState createState() => _InterestedUserState();
}

class _InterestedUserState extends State<InterestedUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/avatar.png'),
                          // foregroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp1'),
                          radius: 65.0,
                        ),
                        first == null ? Text("No User") :
                        Text("User: $first $last"),
                        ElevatedButton(onPressed: () {

                        }, child: Text('Interested'),),
                      ],
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
}
