import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

storyCircle() {
  return const CircleAvatar(
    radius: 32,
    backgroundColor: appColor,
    backgroundImage: AssetImage('assets/images/logo.png'),
  );
}
