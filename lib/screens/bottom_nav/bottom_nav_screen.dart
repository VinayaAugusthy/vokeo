import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_nav_controller.dart';
import '../add_post/add_post_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_scree.dart';
import '../search/search_screen.dart';

// ignore: must_be_immutable
class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final getIndex = Get.put(NavBarController());

  int currentindex = 4;

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomeScreen(),
      const SearchScreen(),
      const AddPostScreen(),
      ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
    ];
    return Scaffold(
      body: Obx(() => pages[getIndex.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            getIndex.onSelected(value);
            print(value);
          },
          currentIndex: getIndex.currentIndex.value,
          items: const [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.search)),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.add_box_outlined),
            ),
            // BottomNavigationBarItem(
            //   label: '',
            //   icon: Icon(Icons.notifications_none),
            // ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person_outlined),
            )
          ],
        ),
      ),
    );
  }
}