import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';

postContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/dhoni.jpeg'),
          ),
          kWidth10,
          Text('Username'),
        ],
      ),
      kheight20,
      const Text('Hello friends....'),
      kheight20,
      Card(
        child: Image.asset(
          'assets/images/sachin.jpg',
          fit: BoxFit.cover,
        ),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
        ],
      ),
      const Text('210 likes'),
      const Text('70 comments'),
      kheight20,
    ],
  );
}
