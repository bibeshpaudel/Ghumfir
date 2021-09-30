import 'dart:convert';
import 'package:ghumfir/match.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getMatchurl1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  http.Response response = await http.get(Uri.parse('$match1url'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },
  );
  print('match1 info');
  String data = response.body;
  print(response.statusCode);
  var decodeData = jsonDecode(data);
  print(decodeData);
}
Future getMatchurl2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  http.Response response = await http.get(Uri.parse('$match2url'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },
  );
  print('match2 info');
  String data = response.body;
  print(response.statusCode);
  var decodeData = jsonDecode(data);
  print(decodeData);
}

Future getMatchurl3() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  http.Response response = await http.get(Uri.parse('$match3url'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },
  );
  print('match3 info');
  String data = response.body;
  print(response.statusCode);
  var decodeData = jsonDecode(data);
  print(decodeData);
}