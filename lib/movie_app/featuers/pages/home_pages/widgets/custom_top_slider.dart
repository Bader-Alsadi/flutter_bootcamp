import 'package:app/movie_app/core/routeNames.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class customSlider extends StatelessWidget {
  customSlider({super.key, required this.imageVlue});
  List<String> imageVlue;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageVlue.length,
        itemBuilder: (_, index, index2) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, playVideo);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageVlue[index],
                  fit: BoxFit.fill,
                  width: 270,
                ),
              ),
            ),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4 - 40,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }
}
