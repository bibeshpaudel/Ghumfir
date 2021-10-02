import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? final1;

String? pp1;
String? first;
String? last;
String? email;

Future getinterested() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    var counter1 = prefs.getInt('pk') ?? 0;
    http.Response response = await http.get(Uri.parse(
        'http://ghumfir003.pythonanywhere.com/api/matchNotif/$counter1/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },
    );
    print('interested');
    String data = response.body;
    print(response.statusCode);
    var decodeData = jsonDecode(data);
    print(decodeData);
    final1 = decodeData[0]['user'].toString();
    print(final1);
  }
  catch(e)
  {
    print(e);
  }
}

Future finalinterested() async{
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    http.Response response = await http.get(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/userInfo/$final1/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },
    );
    var data = response.body;
    var decodeData = jsonDecode(data);
    print(jsonDecode(data));
    pp1 = decodeData['pp_info'][0]['pp_size'].toString();
    first = decodeData['first_name'].toString();
    last = decodeData['last_name'].toString();
    email = decodeData['email'].toString();
    print(pp1);
  }
  catch (e) {
    print(e);
  }
  }