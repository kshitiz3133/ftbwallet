import 'package:flutter/material.dart';
import 'package:ftbwallet/Authentication/Sign%20In/login.dart';
import 'package:ftbwallet/Home/home.dart';
import 'package:ftbwallet/functionalities/ussd.dart';
import 'package:ftbwallet/homePage.dart';

import 'Home/send.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'nothing-font',
      ),
      home: UssdMessage()
    );
  }
}

