import 'dart:convert';
import 'package:ghumfir/match.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? match1id;
String? match1username;
String? match1firstname;
String? match1lastname;
String? match1email;
String? match1kyc;
String? pp1;

String? match2id;
String? match2username;
String? match2firstname;
String? match2lastname;
String? match2email;
String? match2kyc;
String? pp2;

String? match3id;
String? match3username;
String? match3firstname;
String? match3lastname;
String? match3email;
String? match3kyc;

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
  match1id = decodeData['id'].toString();
  match1username = decodeData['username'].toString();
  match1firstname = decodeData['first_name'].toString();
  match1lastname = decodeData['last_name'].toString();
  match1email = decodeData['email'].toString();
  match1kyc = decodeData['kyc_url'].toString();
  try {
    pp1 = decodeData['pp_info'][0]['pp_size'].toString();
  }
  catch (e) {
    pp1 = '/static/images/logo.png';
  }
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
  match2id = decodeData['id'].toString();
  match2username = decodeData['username'].toString();
  match2firstname = decodeData['first_name'].toString();
  match2lastname = decodeData['last_name'].toString();
  match2email = decodeData['email'].toString();
  match2kyc = decodeData['kyc_url'].toString();
  try {
    pp2 = decodeData['pp_info'][0]['pp_size'].toString();
  }
  catch (e) {
    pp2 = '/images/logo.png';
  }
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
  match3id = decodeData['id'].toString();
  match3username = decodeData['username'].toString();
  match3firstname = decodeData['first_name'].toString();
  match3lastname = decodeData['last_name'].toString();
  match3email = decodeData['email'].toString();
  match3kyc = decodeData['kyc_url'].toString();
}

