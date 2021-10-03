import 'package:flutter/material.dart';
import 'package:ghumfir/matched.dart';
import 'package:ghumfir/mypreference.dart';

class Recommended extends StatefulWidget {
  static const id = 'recommended';

  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 210.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            // backgroundImage: AssetImage('images/avatar.png'),
                            foregroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp1'),
                            backgroundColor: pp1 == 'null' ? Colors.black26 : Colors.transparent,
                            radius: 65.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              match1firstname == 'null' ? Text('No User') : Text('User: $match1firstname $match1lastname',style: TextStyle(fontWeight: FontWeight.bold),),
                              match1kyc == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                            ],
                          ),
                          ElevatedButton(onPressed: () async{
                            mypreference1();
                            Navigator.pop(context);
                          }, child: Text('Interested'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 210.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            // backgroundImage: AssetImage('images/avatar.png'),
                            backgroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp2'),
                            backgroundColor: pp2 == 'null' ? Colors.black26 : Colors.transparent,
                            radius: 65.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              match2firstname == 'null' ? Text('No User') : Text('User: $match2firstname $match2lastname',style: TextStyle(fontWeight: FontWeight.bold),),
                              match2kyc == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                            ],
                          ),
                          ElevatedButton(onPressed: () {
                            mypreference2();
                            Navigator.pop(context);
                          }, child: Text('Interested'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 210.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            // backgroundImage: AssetImage('images/avatar.png'),
                            foregroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp3'),
                            backgroundColor: pp3 == 'null' ? Colors.black26 : Colors.transparent,
                            radius: 65.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              match3firstname == 'null' ? Text('No User') : Text('User: $match3firstname $match3lastname',style: TextStyle(fontWeight: FontWeight.bold),),
                              match3kyc == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                            mypreference3();
                            Navigator.pop(context);
                          }, child: Text('Interested'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
