import 'package:flutter/material.dart';
import 'package:flutter_study_ch/features/thread/widgets/nav_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadHomeScreen extends StatelessWidget {
  const ThreadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: false,
              icon: FontAwesomeIcons.house,
            ),
            NavTab(
              isSelected: false,
              icon: FontAwesomeIcons.magnifyingGlass,
            ),
            NavTab(
              isSelected: false,
              icon: FontAwesomeIcons.penToSquare,
            ),
            NavTab(
              isSelected: false,
              icon: FontAwesomeIcons.heart,
            ),
            NavTab(
              isSelected: false,
              icon: FontAwesomeIcons.user,
            ),
          ],
        ),
      ),
    );
  }
}
