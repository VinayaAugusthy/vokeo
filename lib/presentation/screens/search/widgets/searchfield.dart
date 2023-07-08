import 'package:flutter/material.dart';

searchField(
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Search..',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}
