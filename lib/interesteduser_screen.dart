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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                final1 == '0' ? Text("No user's", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),) :
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
                        // backgroundImage: AssetImage('images/avatar.png'),
                        backgroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp1'),
                        backgroundColor: pp1 == 'null' ? Colors.black26 : Colors.transparent,
                        radius: 65.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("$first $last",style: TextStyle(fontWeight: FontWeight.bold),),
                          kyc1 == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                        ],
                      ),

                      Text("Phone no.: $phone1",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                final2 == '0' ? Text('') :
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
                        // backgroundImage: AssetImage('images/avatar.png'),
                        backgroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp2'),
                        backgroundColor: pp2 == 'null' ? Colors.black26 : Colors.transparent,
                        radius: 65.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("$first2 $last2",style: TextStyle(fontWeight: FontWeight.bold),),
                          kyc2 == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                        ],
                      ),
                      Text("Phone no.: $phone2",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                final3 == '0' ? Text('') :
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
                        // backgroundImage: AssetImage('images/avatar.png'),
                        backgroundImage: NetworkImage('http://ghumfir003.pythonanywhere.com$pp3'),
                        backgroundColor: pp3 == 'null' ? Colors.black26 : Colors.transparent,
                        radius: 65.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("$first3 $last3",style: TextStyle(fontWeight: FontWeight.bold),),
                          kyc3 == 'true' ? Icon(Icons.verified, color: Colors.blue,) : Text(''),
                        ],
                      ),
                      Text("Phone no.: $phone3",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
