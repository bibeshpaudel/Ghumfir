import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? final1;
String? final2;
String? final3;

String? pp1;
String? first;
String? last;
String? email;
String? phone1;
String? kyc1;

String? pp2;
String? first2;
String? last2;
String? email2;
String? phone2;
String? kyc2;

String? pp3;
String? first3;
String? last3;
String? email3;
String? phone3;
String? kyc3;

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
    try {
      final1 = decodeData[0]['user'].toString();
    } catch(e) {
      final1 = '0';
    }
    try {
      final2 = decodeData[1]['user'].toString();
    } catch(e) {
      final2 = '0';
    }
    try {
      final3 = decodeData[2]['user'].toString();
    } catch(e) {
      final3 = '0';
    }
    print(final3);
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
    phone1 = decodeData['pp_info'][0]['mobile'].toString();
    kyc1 = decodeData['pp_info'][0]['is_verified'].toString();
  }
  catch (e) {
    print(e);
  }
  }

Future finalinterested2() async{
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    http.Response response = await http.get(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/userInfo/$final2/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },
    );
    var data = response.body;
    var decodeData = jsonDecode(data);
    print(jsonDecode(data));
    pp2 = decodeData['pp_info'][0]['pp_size'].toString();
    first2 = decodeData['first_name'].toString();
    last2 = decodeData['last_name'].toString();
    email2 = decodeData['email'].toString();
    phone2 = decodeData['pp_info'][0]['mobile'].toString();
    kyc2 = decodeData['pp_info'][0]['is_verified'].toString();
  }
  catch (e) {
    print(e);
  }
}
Future finalinterested3() async{
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    http.Response response = await http.get(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/userInfo/$final3/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },
    );
    var data = response.body;
    var decodeData = jsonDecode(data);
    print(jsonDecode(data));
    pp3 = decodeData['pp_info'][0]['pp_size'].toString();
    first3 = decodeData['first_name'].toString();
    last3 = decodeData['last_name'].toString();
    email3 = decodeData['email'].toString();
    phone3 = decodeData['pp_info'][0]['mobile'].toString();
    kyc3 = decodeData['pp_info'][0]['is_verified'].toString();
  }
  catch (e) {
    print(e);
  }
}