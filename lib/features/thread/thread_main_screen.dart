import 'package:flutter/material.dart';
import 'package:flutter_study_ch/features/thread/login_screen.dart';
import 'package:flutter_study_ch/features/thread/search_screen.dart';
import 'package:flutter_study_ch/features/thread/thread_home_screen.dart';
import 'package:flutter_study_ch/features/thread/widgets/nav_tab.dart';
import 'package:flutter_study_ch/features/thread/write_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadMainScreen extends StatefulWidget {
  const ThreadMainScreen({super.key});

  @override
  State<ThreadMainScreen> createState() => _ThreadMainScreenState();
}

class _ThreadMainScreenState extends State<ThreadMainScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: FaIcon(
            FontAwesomeIcons.threads,
            size: 40,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: !(_selectedIndex == 0), // 현재 인덱스가 0인 경우 렌더
            child: ThreadHomeScreen(),
          ),
          Offstage(
            offstage: !(_selectedIndex == 1),
            child: Scaffold(
                body: Center(
              child: SearchScreen(),
            )),
          ),
          Offstage(
            offstage: !(_selectedIndex == 2),
            child: Scaffold(
                body: Center(
              child: WriteScreen(),
            )),
          ),
          Offstage(
            offstage: !(_selectedIndex == 3),
            child: Scaffold(
                body: Center(
              child: Text('Liked page 준비중'),
            )),
          ),
          Offstage(
            offstage: !(_selectedIndex == 4),
            child: Scaffold(
                body: Center(
              child: LoginScreen(),
            )),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                onTap: () => _onTap(2),
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
