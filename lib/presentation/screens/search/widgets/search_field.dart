import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

searchField() {
  TextEditingController searchController = TextEditingController();
  return CupertinoSearchTextField(
    controller: searchController,
    backgroundColor: const Color.fromARGB(255, 199, 192, 192).withOpacity(0.4),
    prefixIcon: const Icon(
      CupertinoIcons.search,
      color: Colors.grey,
    ),
    suffixIcon: const Icon(
      CupertinoIcons.xmark_circle_fill,
      color: Colors.grey,
    ),
    style: const TextStyle(color: Colors.white),
  );
}
