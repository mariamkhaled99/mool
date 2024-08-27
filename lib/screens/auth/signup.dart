import 'package:flutter/material.dart';
import 'package:mool/screens/auth/signin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _selectedCountry;
  final List<String> _countries = ['USA', 'Canada', 'UK', 'India', 'Australia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bottom image only under the form
          Positioned(
            // bottom: 0,
            // left: 0,
            // right: 0,
            child: Image.asset(
              'assets/images/auth.jpeg',
              fit: BoxFit.cover,
              height: 400, // Adjust the height of the image under the form
            ),
          ),
          Column(
            children: [
              // First Section for logo and back button
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    // Back button at the top-left corner
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
                    // Centered logo at the top center
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 140,
                      // right: 80,
                      child: Center(
                        child: Column(
                          children: [Text('Create Account ',style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  
                                  fontSize: 32,
                                ),), Text('Start shopping now',style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 24,
                                ),)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Second Section for the Signup form (on top of the bottom image)
               const SizedBox(height: 30),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    
                    // White container for the signup form
                    Positioned(
                      top: 0, // Remove any overlap from the top
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
                            // Fields and other UI elements
                            _buildTextField(labelText: 'First Name'),
                            const SizedBox(height: 10),
                            _buildTextField(labelText: 'Last Name'),
                            const SizedBox(height: 10),
                            _buildTextField(labelText: 'Email'),
                            const SizedBox(height: 10),

                            DropdownButtonFormField<String>(
                              decoration: _buildInputDecoration('Country'),
                              value: _selectedCountry,
                              items: _countries
                                  .map((country) => DropdownMenuItem(
                                        value: country,
                                        child: Text(country),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCountry = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _buildTextField(
                                    labelText: ' Country Code',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 2,
                                  child:
                                      _buildTextField(labelText: 'Mobile No.'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                                labelText: 'Password', obscureText: true),

                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Add signup logic here
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers the text in the row
                              children: [
                                const Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0,
                                        0), // Text color for the "Login" button
                                    fontWeight:
                                        FontWeight.bold, // Makes the text bold
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigate to the login screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SigninScreen()), 
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0,
                                          0), 
                                      fontWeight: FontWeight
                                          .bold, // Makes the text bold
                                      // decoration: TextDecoration
                                      //     .underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              children: [
                                // Horizontal line before the "OR"
                                SizedBox(
                                  width:
                                      100, // Adjust this value to change the line length
                                  child: Divider(
                                    thickness: 2, // Line thickness
                                    color: Color.fromARGB(
                                        255, 0, 0, 0), // Line color
                                  ),
                                ),

                                // Padding around the "OR" text
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Colors.black, // Text color
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                // Horizontal line after the "OR"
                                SizedBox(
                                  width:
                                      100, // Adjust this value to change the line length
                                  child: Divider(
                                    thickness: 2, // Line thickness
                                    color: Colors.black, // Line color
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers the row content
                            ),
                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers the images in the row
                              children: [
                                // Apple image
                                Image.asset(
                                  'assets/images/Apple.png',
                                  width: 50, // Set the width of the image
                                  height: 50, // Set the height of the image
                                ),

                                // Space between the images
                                SizedBox(
                                    width:
                                        20), // Adjust this value to change the spacing

                                // Google image
                                Image.asset(
                                  'assets/images/Google.png',
                                  width: 50, // Set the width of the image
                                  height: 50, // Set the height of the image
                                ),

                                // Space between the images
                                SizedBox(
                                    width:
                                        20), // Adjust this value to change the spacing

                                // Meta image
                                Image.asset(
                                  'assets/images/Meta.png',
                                  width: 50, // Set the width of the image
                                  height: 50, // Set the height of the image
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
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

  TextField _buildTextField({
    required String labelText,
    bool obscureText = false,
    TextStyle? labelStyle,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            const TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
        ),
      ),
      obscureText: obscureText,
    );
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xF5F5F5), width: 2),
      ),
    );
  }
}
