import 'package:app/movie_app/core/Data/icon_bar_data.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/custom_image_with_rating_bar.dart';
import 'package:app/movie_app/featuers/pages/home_pages/widgets/custom_slider_icons.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: customAppBar(
            title: "category",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomIconSlider(
              listIcons: listIconsBar,
            ),
            CustomImageWithRatingBar(
              withIcon: false,
              withPlayArrwo: true,
            )
          ],
        ),
      ),
    );
  }
}
