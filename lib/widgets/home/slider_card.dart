import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String imgPath;
  final String text;

  const SliderCard({super.key, required this.imgPath, required this.text});

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
                  height: 250,
                  imgPath, // Use the provided image path
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    text, // Use the provided text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
    );
  }
}
