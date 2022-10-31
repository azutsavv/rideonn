import 'package:flutter/material.dart';
import 'package:rideonn/bikewidget.dart';
import 'package:rideonn/forgotpasscode.dart';
import 'package:rideonn/homepage.dart';
import 'package:rideonn/signup.dart';
import 'package:rideonn/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'welcome':(context) => welcome(),
        'signup':(context) => signup(),
        'homepage':(context) => homepage(),
        'forgotpasscode':(context) => forgotpasscode(),
       

      },
    );
  }
}

