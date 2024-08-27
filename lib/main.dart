import 'package:flutter/material.dart';
import 'package:mool/screens/splash.dart'; 
import 'package:mool/screens/welcome.dart'; 
import 'package:mool/screens/auth/signup.dart';
import 'package:mool/screens/auth/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: theme,
      // home: SplashScreen(),
            // home: WelcomePage(),
       home: SignupScreen(),


    );
  }
}
