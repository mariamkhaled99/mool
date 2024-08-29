import 'package:flutter/material.dart';
import 'package:mool/utils/form_utils.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // This will navigate back to the previous screen
          },
        ),
        title: const Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: const Text(
          'Welcome to Home',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
