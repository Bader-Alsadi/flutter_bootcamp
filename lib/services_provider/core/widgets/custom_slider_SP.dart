import 'package:app/services_provider/core/them/padding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSliderSP extends StatelessWidget {
  const CustomSliderSP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (context, index, _) => Card(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: HE_paddding),
              child: Column(
                children: [
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/image/index.jpeg",
                        height: 80,
                        width: 65,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text("bader"),
                    subtitle: Text("programer"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("View profile")),
                  )
                ],
              ),
            )),
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * .20,
        ));
  }
}
