import 'package:flutter/material.dart';
import 'package:flutter_study_ch/features/thread/thread_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter study challenge',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ThreadHomeScreen(),
    );
  }
}
