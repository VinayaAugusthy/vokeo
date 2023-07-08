import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vokeo/presentation/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontFamily: GoogleFonts.kalam().fontFamily),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
