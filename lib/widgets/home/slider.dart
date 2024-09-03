import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mool/widgets/home/slider_card.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sliderItems = [
      {'imgPath': 'assets/images/summer.png', 'text': 'Summer Vibes'},
      {'imgPath': 'assets/images/slider2.gif', 'text': 'Winter Chill'},
      {'imgPath': 'assets/images/summer.png', 'text': 'Spring Blooms'},
    ];
    return Container(
       color:const  Color.fromARGB(255, 241, 237, 237),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              
            ),
            items: sliderItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SliderCard(
                      imgPath: item['imgPath']!,
                      text: item['text']!,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
