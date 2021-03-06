import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:select_form_field/select_form_field.dart';

class InterestScreen extends StatefulWidget {
  static const id = 'interest_screen';

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {

  var location;
  bool? music = false;
  bool? party = false;
  bool? smoke = false;
  bool? drink = false;
  bool? drive = false;

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'ACT',
      'label': 'Annapurna',
    },
    {
      'value': 'MHT',
      'label': 'Mardi',
    },
    {
      'value': 'PKR',
      'label': 'Pokhara',
    },
    {
      'value': 'SRHA',
      'label': 'Sauraha',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Interests', style: TextStyle(
            color: Colors.black,
          ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFC5F4DF),
        ),
        child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
            SelectFormField(
            type: SelectFormFieldType.dropdown,
              icon: Icon(Icons.location_on),
              labelText: 'Location',
              items: _items,
              onChanged: (val) => setState(() => location = val),
            ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Music', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      Checkbox(value: music, onChanged: (bool? value) {
                        setState(() {
                          music = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Party', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      Checkbox(value: party, onChanged: (bool? value) {
                        setState(() {
                          party = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Driving', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      Checkbox(value: drive, onChanged: (bool? value) {
                        setState(() {
                          drive = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Smoking', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      Checkbox(value: smoke, onChanged: (bool? value) {
                        setState(() {
                          smoke = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Drinking', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                      Checkbox(value: drink, onChanged: (bool? value) {
                        setState(() {
                          drink = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 60.0,
                  width: 200.0,
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      interest();
                    });
                  },
                    child: Text('Submit', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                  style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)
                      ),
                  )),
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
  Future interest() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    var counter1 = prefs.getInt('pk') ?? 0;
    var response = await http.post(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/interest/'),
      body: jsonEncode({
        'location':location,
        'smoking':smoke,
        'drinking':drink,
        'party':party,
        'driving':drive,
        'musical':music,
        'user': counter1,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },);
    print(response.body);
    print(response.statusCode);
    var response1 = await http.patch(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/interest/$counter1/'),
      body: jsonEncode({
        'location':location,
        'smoking':smoke,
        'drinking':drink,
        'party':party,
        'driving':drive,
        'musical':music,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },);
    print(response1.body);
    print(response1.statusCode);
    if(response1.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Interest Submitted')));
      Navigator.pop(context);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cannot Submit Interest")));
    }
  }
}
