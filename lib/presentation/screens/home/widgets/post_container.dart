import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';

postContainer() {
  return Column(
    children: [
      const Row(
        children: [
          CircleAvatar(),
          kWidth10,
          Text('Username'),
        ],
      ),
      kheight20,
      Card(
        child: Image.asset('assets/images/logo.png'),
      ),
      Row(
        children: [
          const Icon(
            Icons.favorite_outline,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.comment),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border))
        ],
      ),
      kheight20,
    ],
  );
}
