import 'dart:io';
import 'dart:math';

import 'package:app/utlis/assetsI_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePer extends StatefulWidget {
  const ProfilePer({super.key});

  @override
  State<ProfilePer> createState() => _ProfilePerState();
}

class _ProfilePerState extends State<ProfilePer> {
  String? imagep;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (context, index, inex) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "${assetIMG}${Random().nextInt(4) + 1}.jpg",
                          height: 200,
                          width: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                  options: CarouselOptions(
                      // height: 400,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2)))
            ],
          ),
          Center(
            child: imagep != null
                ? Image.file(File(imagep!))
                : Container(
                    child: Text("not found"),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ImagePicker picker = ImagePicker();
          XFile? imagrPath = await picker.pickImage(source: ImageSource.camera);
          imagep = imagrPath!.path;
          setState(() {});
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
