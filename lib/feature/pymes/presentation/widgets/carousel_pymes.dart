import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'https://i.pinimg.com/564x/c1/65/4a/c1654a198f2e0e5289ac60799f90bf2e.jpg',
      'https://i.pinimg.com/564x/bc/b8/13/bcb8139e67483bbc3b8b2fbff97e2768.jpg',
      'https://i.pinimg.com/564x/cc/ff/51/ccff519eb1351b4e843954c46d337a3f.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          // Handle change between tabs
        },
      ),
      items: imgList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Image.network(item, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}
