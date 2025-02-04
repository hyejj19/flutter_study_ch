import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
  });

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.5,
          duration: Duration(microseconds: 300),
          child: FaIcon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
