import 'package:flutter/material.dart';
import 'package:mool/screens/home.dart';
import 'package:mool/utils/form_utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the keyboard height
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    void Onsubmit() {
    
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  HOmeScreen(),
        ),
      );
    } 
  

    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 241, 237, 237),
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 410, // Match the height of the previous image
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A2E33), // First color in the gradient
                    Color(0xFF292D32), // Second color in the gradient
                  ],
                  stops: [0.4427, 1.0], // Percentage points for the gradient
                ),
              ),
            ),
          ),
          Positioned(
            top: 0, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Container(
              height: 30, // Adjust the height as needed
              color: Colors.black,
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
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
                    const Positioned(
                      top: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.0), // Adjust the value as needed
                            child: Text(
                              'Reset\nPassword',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 42,
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
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 60),
                            buildTextField(labelText: 'Password',obscureText: true),
                            const SizedBox(height: 20),
                            buildTextField(
                                labelText: 'Confirm Password',
                                obscureText: true),
                            const SizedBox(height: 130),
                            Padding(
                              padding: EdgeInsets.only(bottom: keyboardHeight),
                              child: ElevatedButton(
                                onPressed: () {
                                  Onsubmit();
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
                                  'Submit',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 230),
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
