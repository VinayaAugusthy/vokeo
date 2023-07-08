import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';

storyCircle() {
  return const CircleAvatar(
    radius: 32,
    backgroundColor: appColor,
    backgroundImage: AssetImage('assets/images/logo.png'),
  );
}
