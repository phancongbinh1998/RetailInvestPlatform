import 'package:flutter/material.dart';

import 'screens/login.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      title: 'Retail Invest Platform',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
