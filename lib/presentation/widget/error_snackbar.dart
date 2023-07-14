import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/colors.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: appColor,
  ));
}
