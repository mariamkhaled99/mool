import 'package:flutter/material.dart';
import 'package:mool/screens/auth/reset_password.dart';
import 'package:mool/utils/otp_utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Method to validate and submit the form
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form is valid, OTP submitted!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the keyboard height
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 190, 
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A2E33),
                    Color(0xFF292D32), 
                  ],
                  stops: [0.4427, 1.0], 
                ),
              ),
            ),
          ),
          Positioned(
            top: 0, 
            left: 0,
            right: 0,
            child: Container(
              height: 70, // Adjust the height as needed
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
                      top: 80,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Positioned(
                      top: 90,
                      left: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Verification',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/otp.png',
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 20),
                              const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Enter 4 Digits code has been sent to ',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '+961518745363 ',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ]),
                              const SizedBox(height: 20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OtpField(),
                                  OtpField(),
                                  OtpField(),
                                  OtpField(),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Resend code in 00:59 ',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    
                                  ]),
                              const SizedBox(height: 60),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: keyboardHeight),
                                child: ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 150, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child:  const Text(
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
