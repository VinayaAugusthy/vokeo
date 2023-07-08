import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
          )
        ],
        onTap: (value) {
          setState(() {
            _bottomIndex = value;
          });
        },
      ),
      body: navItems[_bottomIndex],
    );
  }
}
