import 'package:flutter/material.dart';
import 'package:submission_flutter/landing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Apps Submission',
      theme: ThemeData(),
      home: const LandingPage(),
    );
  }
}