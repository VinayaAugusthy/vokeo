import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/home/widgets/post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'VOKEO',
                    style: TextStyle(fontSize: 24, color: appColor),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.messenger_outline_rounded))
                ],
              ),
              Expanded(
                child: ListView(
                  children: List.generate(8, (index) => postContainer()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
