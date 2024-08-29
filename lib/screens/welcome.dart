import 'package:flutter/material.dart';
import 'package:mool/screens/auth/signin.dart';
import 'package:mool/screens/auth/signup.dart';
import 'package:mool/widgets/welcome/stack_images.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void navigateToSignInScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SigninScreen()));
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              // Image section
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),

              // Stack with overlapping images
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Center(
                  child: SizedBox(
                    width: 350,
                    height: 160,
                    child: Stackimages(),
                  ),
                ),
              ),

              const SizedBox(
                  height: 20), // Add space between the stack and text

              // Text section
              const Align(
                alignment: Alignment.centerLeft, 
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0), 
                  child: Text(
                    'Find the\nbest collection', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Bottom section with increased height
          Container(
            height: 350, // Adjusted height for more space
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the left
              children: [
                const Text(
                  'Get your dream items easily with Mooland. Enjoy other interesting offers too!',
                  textAlign: TextAlign.left, // Center the text horizontally
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                    height: 30), // Increased spacing between text and buttons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center buttons horizontally
                  children: [
                    SizedBox(
                      child: OutlinedButton(
                        onPressed: () => navigateToSignUpScreen(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 45),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width:
                                2.0, // Increase this value to make the border thicker
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () => navigateToSignInScreen(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 45),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 20), // Added spacing before the guest text
                const Align(
                  alignment: Alignment
                      .centerLeft, // Align "Continue as guest" to the left
                  child: Text(
                    'Continue as guest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 10), // Added spacing before the centered text
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'By continuing, you agree to our',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Terms and conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
