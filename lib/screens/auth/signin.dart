import 'package:flutter/material.dart';
import 'package:mool/utils/form_utils.dart';
import 'package:mool/screens/auth/signup.dart';
// import 'package:mool/screens/auth/reset_password.dart';
import 'package:mool/screens/auth/forget_password.dart';




class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/auth.jpeg',
              fit: BoxFit.fitHeight,
              height: 410,
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      // top: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 140,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Sign In',
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.0), // Adjust the value as needed
                            child: Text(
                              'Welcome !',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 241, 237, 237),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            buildTextField(labelText: 'Email'),
                            const SizedBox(height: 10),
                            buildTextField(
                                labelText: 'Password', obscureText: true),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 160.0), // Apply right padding
                                child: Text(
                                  'Forget Password ?',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(
                                        0xFF33CCCC), // Add your desired color here
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Add signup logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don’t Have account ? ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'signup',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Divider(
                                    thickness: 2,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Apple.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/images/Google.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/images/Meta.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
