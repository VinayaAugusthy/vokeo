import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/core/constants/colors.dart';
import 'package:vokeo/infrastructure/authentication/firebase_auth_method.dart';
import 'package:vokeo/presentation/screens/authentication/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:vokeo/presentation/screens/base/base_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FireBaseAuthMethods>(
          create: (context) => FireBaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FireBaseAuthMethods>().authState,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: appColor,
          buttonTheme: const ButtonThemeData(buttonColor: appColor),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
                color: appColor, fontFamily: GoogleFonts.kalam().fontFamily),
            bodyMedium: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.kalam().fontFamily),
          ),
        ),
        darkTheme: ThemeData.dark(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return const BaseScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
