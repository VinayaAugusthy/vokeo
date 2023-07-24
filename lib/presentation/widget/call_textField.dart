// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget callTextField(
    {required String labelName,
    required TextEditingController controllerName,
    TextInputType? keys,
    bool obscureText = false,
    required String? Function(String? value) validation}) {
  return TextFormField(
    keyboardType: keys,
    controller: controllerName,
    obscureText: obscureText,
    validator: validation,
    decoration: InputDecoration(
      label: Text(labelName),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
