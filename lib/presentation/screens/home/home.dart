import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/home/widgets/stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blueGrey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 36, bottom: 10, left: 32),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_sharp),
                        color: appColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
