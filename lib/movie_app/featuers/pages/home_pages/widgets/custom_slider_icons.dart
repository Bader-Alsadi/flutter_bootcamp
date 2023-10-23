import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

Container customIconSlider(BuildContext context,
      {required List<Map<String, dynamic>> listIcons}) {
    return Container(
      height: 100,
      color: primary,
      margin: EdgeInsets.only(top: miniSpacer),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: listIcons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: appPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listIcons[index]["Icon"]!,
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      listIcons[index]["name"]!.toUpperCase(),
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              )),
    );
  }