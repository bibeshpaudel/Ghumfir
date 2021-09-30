// import 'package:ghumfir/match.dart';
// import 'package:ghumfir/matched.dart';
import 'package:flutter/material.dart';
class MatchScreen extends StatefulWidget {
  static const id = 'match_screen';

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
            children: <Widget>[
              ElevatedButton(onPressed: () {
                // setState(() {
                //   getMatch().then((value) {
                //     getMatchurl1();
                //     getMatchurl2();
                //     getMatchurl3();
                //   });
                // });
              }, child: Text('Match'),),
              // ElevatedButton(onPressed: () {
              //   setState(() {
              //     getMatchurl();
              //   });
              // }, child: Text('Match1'),),
            ],
        ),
          ),),
      ),
    );
  }
//   Future getMatch() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var counter = prefs.getString('key') ?? 0;
//     var counter1 = prefs.getInt('pk') ?? 0;
//     http.Response response = await http.get(Uri.parse('http://ghumfir002.pythonanywhere.com/api/match/$counter1/'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': '*/*',
//         'Authorization': 'Token $counter',
//       },
//     );
//       String data = response.body;
//       print(response.statusCode);
//       var decodeData = jsonDecode(data);
//       print(decodeData['match1_url']);
//     prefs.setString("match", decodeData['match1_url']);
//
//   }
//   Future getMatchurl() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var counter = prefs.getString('key') ?? 0;
//     var counter1 = prefs.getString('match') ?? 0;
//     http.Response response = await http.get(Uri.parse('$counter1'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': '*/*',
//         'Authorization': 'Token $counter',
//       },
//     );
//     print('match info');
//     String data = response.body;
//     print(response.statusCode);
//     var decodeData = jsonDecode(data);
//     print(decodeData);
//   }
 }
