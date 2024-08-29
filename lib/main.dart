import 'package:flutter/material.dart';
import 'package:mool/screens/auth/signin.dart';
import 'package:mool/screens/auth/otp.dart';
import 'package:mool/screens/auth/forget_password.dart';
import 'package:mool/screens/auth/reset_password.dart';
import 'package:mool/screens/auth/signup.dart';
import 'package:mool/screens/splash.dart';
import 'package:mool/screens/welcome.dart';
import 'package:mool/screens/home.dart';


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
      //  home: SignupScreen(),
      //  home: SigninScreen(),
      // home: ResetPasswordScreen(),
      home: ForgetPasswordScreen(),
        // home: OtpScreen(),
        //  home: HOmeScreen(),
    );
  }
}
