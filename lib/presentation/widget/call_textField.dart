import 'package:flutter/material.dart';

Widget callTextField(
    {required String labelName,
    required TextEditingController controllerName,
    TextInputType? keys,
    bool obscureText = false,
    required String? validation(String? value)}) {
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
