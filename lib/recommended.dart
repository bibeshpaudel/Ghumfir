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
                            foregroundImage: pp1 == 'null' ? NetworkImage('http://ghumfir003.pythonanywhere.com/static/images/logo.png') :NetworkImage('http://ghumfir003.pythonanywhere.com$pp1'),
                            radius: 65.0,
                          ),
                          match1firstname == 'null' ? Text('No User') : Text('User: $match1firstname $match1lastname'),
                          ElevatedButton(onPressed: () async{
                            mypreference1();
                          }, child: Text('Interested'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
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
                            // foregroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp2'),
                            foregroundImage: pp2 == 'null' ? NetworkImage('http://ghumfir003.pythonanywhere.com/static/images/logo.png') :NetworkImage('http://ghumfir003.pythonanywhere.com$pp2'),
                            radius: 65.0,
                          ),
                          match2firstname == 'null' ? Text('No User') : Text('User: $match2firstname $match2lastname'),
                          ElevatedButton(onPressed: () {
                            mypreference2();
                          }, child: Text('Interested'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
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
                            // foregroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp3'),
                            radius: 65.0,
                          ),
                          match3firstname == 'null' ? Text('No User') : Text('User: $match3firstname $match3lastname'),
                          // Text('User: $match3firstname $match3lastname'),
                          ElevatedButton(
                            onPressed: () {
                            mypreference3();
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
