import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderPage extends StatelessWidget {
  CarouselSliderPage({
    super.key,
  });

  // static List items = [Colors.yellow, Colors.blue, Colors.green];
  static List<String> imageString = [
    "images/place1.jpg",
    "images/place2.jpg",
    "images/place3.jpg",
    "images/place4.jpg",
    "images/place1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
        items: imageString.map((item) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
