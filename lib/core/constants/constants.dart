import 'package:flutter/material.dart';
import 'package:vokeo/presentation/screens/home/home.dart';
import 'package:vokeo/presentation/screens/notificcations/notifications.dart';
import 'package:vokeo/presentation/screens/post_screen.dart';
import 'package:vokeo/presentation/screens/profile/profile_screen.dart';
import 'package:vokeo/presentation/screens/search/search_screen.dart';

const kheight20 = SizedBox(
  height: 20,
);
const kheight30 = SizedBox(
  height: 30,
);
const kWidth10 = SizedBox(
  width: 10,
);
const kWidth30 = SizedBox(
  width: 30,
);
const textBold = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
List navItems = [
  const HomeScreen(),
  SearchScreen(),
  const PostScreen(),
  const Notifications(),
  const ProfileScreen()
];
