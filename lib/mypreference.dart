import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ghumfir/matched.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

Future mypreference1() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var counter1 = prefs.getInt('pk') ?? 0;
  var response1 = await http.patch(
    Uri.parse('http://ghumfir003.pythonanywhere.com/api/match/$counter1/'),
    body: jsonEncode({
      'preferred' : match1id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },);
  print(response1.statusCode);
  print(response1.body);
}

Future mypreference2() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var counter1 = prefs.getInt('pk') ?? 0;
  var response1 = await http.patch(
    Uri.parse('http://ghumfir003.pythonanywhere.com/api/match/$counter1/'),
    body: jsonEncode({
      'preferred' : match2id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },);
  print(response1.statusCode);
  print(response1.body);
}

Future mypreference3() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var counter = prefs.getString('key') ?? 0;
  var counter1 = prefs.getInt('pk') ?? 0;
  var response1 = await http.patch(
    Uri.parse('http://ghumfir003.pythonanywhere.com/api/match/$counter1/'),
    body: jsonEncode({
      'preferred' : match3id,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'Authorization': 'Token $counter',
    },);
  print(response1.statusCode);
  print(response1.body);
}