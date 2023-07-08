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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'Profile')
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: _bottomIndex,
        showSelectedLabels: false,
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
