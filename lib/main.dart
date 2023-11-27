// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/pages/home_page.dart';
import 'package:todo_flutter_spring_app/pages/utils.dart';
import 'package:todo_flutter_spring_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'My Android App',
      home: LandingPage(),
    );
  }
}
