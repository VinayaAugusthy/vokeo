import 'package:flutter/material.dart';

profileGrid() {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/sachin.jpg',
            ),
          ),
        ),
      );
    },
  );
}
