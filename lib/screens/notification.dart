import 'package:flutter/material.dart';
import 'package:mool/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 140, // Adjust height as needed
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
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                          width:
                              10), // Adjust spacing between the arrow and text
                      const Text(
                        "Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70, // Adjust height as needed
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Column(
              children: [
               NotificationItem(),
            const Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 241, 237, 237),),
            NotificationItem(),
            const Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 241, 237, 237),),
            
            NotificationItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
