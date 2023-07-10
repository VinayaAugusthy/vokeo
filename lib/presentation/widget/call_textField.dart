import 'package:flutter/material.dart';

Widget callTextField({
  required String labelName,
  required TextEditingController controllerName,
  TextInputType? keys,
}) {
  return TextFormField(
    keyboardType: keys,
    controller: controllerName,
    validator: (value) {
      if (controllerName.text.isEmpty) {
        return 'This field cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      label: Text(labelName),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
