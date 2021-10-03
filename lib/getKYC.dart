import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ghumfir/first_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ghumfir/kyc_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

String? mobile;
String? dob;
String? gender;
String? father;
String? mother;
String? clocation;
String? plocation;
String? education;
String? occupation;
String? cnumber;
String? idistrict;
String? idate;
String? pp;
String? cpp;
String? verified;



Future getKYC() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var counter1 = prefs.getInt('pk') ?? 0;
  var response = await http.get(
      Uri.parse('http://ghumfir003.pythonanywhere.com/api/kyc/$counter1/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Token $counter',
      },);
  String data = response.body;
  var decodeData = jsonDecode(data);
  print(jsonDecode(response.body));
  mobile = decodeData['mobile'].toString();
  dob = decodeData['dob'].toString();
  gender = decodeData['gender'].toString();
  father = decodeData['father_name'].toString();
  mother = decodeData['mother_name'].toString();
  clocation = decodeData['current_location'].toString();
  plocation = decodeData['permanent_location'].toString();
  education = decodeData['education'].toString();
  occupation = decodeData['occupation'].toString();
  cnumber = decodeData['citizenship_number'].toString();
  idistrict = decodeData['citizenship_issue_district'].toString();
  idate = decodeData['citizenship_issue_date'].toString();
  pp = decodeData['pp_size'].toString();
  cpp = decodeData['citizenship_photo'].toString();
  verified = decodeData['is_verified'].toString();

  if(response.statusCode == 200) {
   await navigatorKey.currentState!.pushNamed(KycScreen.id);
  }
  else
    {
      navigatorKey.currentState!.pushNamed(FirstScreen.id);
    }
}