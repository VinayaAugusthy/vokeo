import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/download.svg'),
            const Text(
              'VOKEO',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
