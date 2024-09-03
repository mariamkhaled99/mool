import 'package:flutter/material.dart';
import 'package:mool/screens/home.dart';
import 'package:mool/screens/auth/signup.dart';




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
      // home: ForgetPasswordScreen(),
        // home: OtpScreen(),
         home: HOmeScreen(),
    );
  }
}
