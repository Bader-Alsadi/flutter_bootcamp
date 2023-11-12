import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (context, index, ___) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  child: Image.asset(
                    "assets/image/${index + 1}.jpg",
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height / 4.8,
          autoPlayCurve: Curves.linear,
          autoPlay: true,
        ));
  }
}
