import 'package:flutter/material.dart';
import 'package:test_1/main.dart';
import 'package:test_1/model/loadData.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Center(
                child: Text('email: ${snapshot.data!.email}' +
                    'password: ${snapshot.data!.password}'),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
