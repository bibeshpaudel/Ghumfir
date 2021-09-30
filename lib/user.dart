import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future userData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var response = await http.get(
    Uri.parse('http://ghumfir002.pythonanywhere.com/api/auth/user/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },
  );
  if(response.statusCode == 200) {
    String data = response.body;
    var decodeData = json.decode(data);
    print(decodeData['pk']);
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("pk", decodeData['pk']);
  }
}