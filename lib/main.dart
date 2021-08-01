import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'model/loadData.dart';
import 'pages/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

Future<LoadData> apiCall() async {
  final baseUrl = 'http://mobile-test.itfox-web.com:80/';

  final response = await http.get(
      Uri.parse('https://documenter.getpostman.com/view/3571780/TW74hPjn'));
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('hello world');
  }
}

class MyApp extends StatelessWidget {
  final Color myColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My cat',
      home: SignInPage(),
    );
  }
}