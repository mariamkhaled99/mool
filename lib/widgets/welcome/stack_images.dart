import 'package:flutter/material.dart';

class Stackimages extends StatelessWidget {
  const Stackimages({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -70,
          right: 20,
          child: Image.asset(
            'assets/images/Ellipse6.png',
            width: 170,
            height: 320,
          ),
        ),
        Positioned(
          bottom: -55,
          left: 77,
          child: Image.asset(
            'assets/images/woman_home.png',
            width: 150,
            height: 300,
          ),
        ),
        Positioned(
          bottom: -60,
          left: 70,
          child: Image.asset(
            'assets/images/Ellipse6.png',
            width: 170,
            height: 320,
          ),
        ),
        Positioned(
          bottom: -60,
          right: 30,
          child: Image.asset(
            'assets/images/man_home.png',
            width: 150,
            height: 300,
          ),
        ),
      ],
    );
  }
}
