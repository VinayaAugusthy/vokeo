import 'package:flutter/material.dart';
import 'package:vokeo/presentation/screens/home/home.dart';
import 'package:vokeo/presentation/screens/notificcations/notifications.dart';
import 'package:vokeo/presentation/screens/profile/profile_screen.dart';
import 'package:vokeo/presentation/screens/search/search_screen.dart';

import '../../presentation/screens/post_screen.dart';

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
  const SearchScreen(),
  const PostScreen(),
  const Notifications(),
  const ProfileScreen()
];
const dp =
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngitem.com%2Fmiddle%2Fmmhwxw_transparent-user-png-default-user-image-png-png%2F&psig=AOvVaw2EltcpUd5xCKpuekXdxwMn&ust=1690635330435000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPiDqce5sYADFQAAAAAdAAAAABAF';
