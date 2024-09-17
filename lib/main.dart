import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import the Riverpod package
import 'package:mool/screens/home.dart';
import 'package:mool/screens/auth/signup.dart';
import 'package:mool/screens/product/product_details.dart';
import 'package:mool/screens/search.dart';
import 'package:mool/screens/splash.dart';
import 'package:mool/screens/welcome.dart';




void main() {
  runApp(const ProviderScope(child: MyApp())); // Wrap your app with ProviderScope
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: theme,
      home: SplashScreen(),
      // home: WelcomePage(),
      //  home: SignupScreen(),
      //  home: SigninScreen(),
      // home: ResetPasswordScreen(),
      // home: ForgetPasswordScreen(),
        // home: OtpScreen(),
        //  home: HOmeScreen(),
        //  home:SearchScreen(),
        //  home:ProductDetailsScreen(),
    );
  }
}
