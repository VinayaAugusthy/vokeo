import 'package:flutter/material.dart';

Widget callTextField({
  required String labelName,
  required TextEditingController controllerName,
  TextInputType? keys,
}) {
  return TextFormField(
    keyboardType: keys,
    controller: controllerName,
    decoration: InputDecoration(
      label: Text(labelName),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
