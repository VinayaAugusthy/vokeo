import 'package:flutter/material.dart';

Widget callTextField(String labelName, TextEditingController controllerName) {
  return TextFormField(
    controller: controllerName,
    decoration: InputDecoration(
      label: Text(labelName),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
