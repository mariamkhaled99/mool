import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mool/widgets/home/slider_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sliderItems = [
      {
        'imgPath': 'assets/images/summer.png',
        'text': 'NEW\nSUMMER\nCOLLECTION\n2023',
        'button_text': 'Shop now'
      },
      {
        'imgPath': 'assets/images/slider2.gif',
        'text': 'NEW\nSUMMER\nCOLLECTION\n2023',
        'button_text': 'Watch now'
      },
      {
        'imgPath': 'assets/images/summer.png',
        'text': 'NEW\nSUMMER\nCOLLECTION\n2023',
        'button_text': 'Watch now'
      },
    ];

    return Container(
      color: const Color.fromARGB(255, 241, 237, 237),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 360, // Ensures your carousel height
              viewportFraction: .9, // Takes the full width of the screen
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: sliderItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    // Ensures the image takes up full width
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),

                    child: SliderCard(
                      imgPath: item['imgPath']!,
                      text: item['text']!,
                      button_text: item['button_text']!,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // Dot indicator
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: sliderItems.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotHeight: 5,
              dotWidth: 10,
              expansionFactor: 3,
              spacing: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
