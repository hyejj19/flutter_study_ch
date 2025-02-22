import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_ch/features/thread/thread_main_screen.dart';
import 'package:flutter_study_ch/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: ThreadMainScreen(),
    );
  }
}
