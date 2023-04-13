import 'package:chat_by_me/screens/authentication/intro.dart';
import 'package:chat_by_me/screens/authentication/login.dart';
import 'package:chat_by_me/screens/home/navigation_bar.dart';
import 'package:chat_by_me/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat By Me',
      home: IntroScreen(),
      theme: ThemeData.light(),
    );
  }
}
