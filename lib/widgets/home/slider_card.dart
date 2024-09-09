import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String imgPath;
  final String text;
  final String button_text;

  const SliderCard({super.key, required this.imgPath, required this.text, required this.button_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 241, 237, 237),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Rounded corners
                child: Image.asset(
                  imgPath, // Use the provided image path
                  height: 300,
                  width: MediaQuery.of(context).size.width, // Set width to screen width
                  fit: BoxFit.cover, // Ensures the image covers the entire space
                ),
              ),
              Positioned(
                bottom: 70,
                left: 10, // Adjust the position of the text
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              
              Positioned(
                bottom: 70,
                left: 30,
                child: Image.asset('assets/images/slider/Ellipse 8.png'),
              ),
              Positioned(
                bottom: 60,
                left: 15,
                child: Image.asset('assets/images/slider/Ellipse 8.png'),
              ),
              Positioned(
                bottom: 80,
                left: 45,
                child: Image.asset('assets/images/slider/Ellipse 8.png'),
              ),
              Positioned(
                bottom: 10,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 60), // Width: 150, Height: 60
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        button_text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
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
