import 'package:flutter/material.dart';
import 'package:mool/screens/home.dart';

class OrderSubmittedScreen extends StatelessWidget {
  const OrderSubmittedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
             
              crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
              children: [
                Image.asset(
                  'assets/images/complete 1.png',
                  height: 150, // Adjust size as needed
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'We Get it!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Your order was submitted successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'You will get notifications for your \norder’s status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 110, 109, 109),
                    fontSize: 20,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                         onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HOmeScreen(),
                  ),
                ),
                        child: const Text(
                         
                               "Go back to home",
                          style:  TextStyle(color: Colors.white,fontSize: 20,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
