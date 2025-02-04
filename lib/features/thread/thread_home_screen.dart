import 'package:flutter/material.dart';

class ThreadHomeScreen extends StatefulWidget {
  const ThreadHomeScreen({super.key});

  @override
  State<ThreadHomeScreen> createState() => _ThreadHomeScreenState();
}

class _ThreadHomeScreenState extends State<ThreadHomeScreen> {
  @override
  void initState() {
    super.initState();
    print('냐옹??');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('냐옹1'),
      ),
    );
  }
}
