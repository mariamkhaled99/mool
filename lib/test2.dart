import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 255, 190),
      padding: const EdgeInsets.all(16.0), // Add padding around the entire row
      child: Container(
        color: Colors.white, // Background color for the row
        padding: const EdgeInsets.all(16.0), // Padding inside the row's container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // First Image with Text
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      child: Image.asset(
                        'assets/images/card1.png',
                        width: 156,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.8), // White background with slight transparency
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: const Text(
                          'Card 1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                           
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Second Image with Text
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      child: Image.asset(
                        'assets/images/card2.jpeg',
                        width: 156,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.8), // White background with slight transparency
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: const Text(
                          'Card 2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
