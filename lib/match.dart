import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? match1url;
String? match2url;
String? match3url;

Future getMatch() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var counter1 = prefs.getInt('pk') ?? 0;
  http.Response response = await http.get(Uri.parse('http://ghumfir003.pythonanywhere.com/api/match/$counter1/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },
  );
  print('match');
  String data = response.body;
  print(response.statusCode);
  var decodeData = jsonDecode(data);
  print(decodeData);
  match1url =decodeData['match1_url'];
  match2url =decodeData['match2_url'];
  match3url =decodeData['match3_url'];
}