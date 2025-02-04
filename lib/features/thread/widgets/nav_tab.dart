import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.5,
          duration: Duration(milliseconds: 100),
          child: FaIcon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
