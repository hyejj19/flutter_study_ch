import 'package:flutter/material.dart';
import 'package:flutter_study_ch/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login";
  static String routeURL = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Text('암것도없음')),
      ),
    );
  }
}
