import 'dart:math';

import 'package:app/movie_app/core/Data/image_value.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomImageWithRatingBar extends StatelessWidget {
  CustomImageWithRatingBar({
    this.withIcon = true,
    this.withPlayArrwo = false,
    super.key,
  });
  bool withIcon;
  bool withPlayArrwo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 170,
      child: ListView.separated(
          itemBuilder: (_, index) => Container(
                padding: EdgeInsets.all(miniSpacer),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageVlues[index],
                              width: 120,
                              height: 80,
                              fit: BoxFit.fill,
                            )),
                        withPlayArrwo
                            ? Icon(
                                Icons.play_arrow,
                                color: yellow,
                                size: 50,
                              )
                            : Container()
                      ],
                    ),
                    SizedBox(
                      width: miniSpacer,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.hd, color: yellow),
                        Text(
                          "movie${index + 1}",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "action",
                          style: TextStyle(color: yellow),
                        ),
                        SizedBox(
                          // width: 50,
                          child: RatingBar(
                            itemSize: 10,
                            ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: yellow,
                                ),
                                half: Icon(
                                  Icons.star,
                                  color: yellow,
                                ),
                                empty: Icon(
                                  Icons.star,
                                  color: white,
                                )),
                            onRatingUpdate: (h) {},
                            minRating: 1,
                            maxRating: 5,
                            initialRating: Random().nextInt(4) + 1,
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    withIcon
                        ? Icon(
                            Icons.circle_outlined,
                            color: white.withOpacity(0.4),
                            size: 20,
                          )
                        : Container(),
                  ],
                ),
              ),
          separatorBuilder: (_, index) => Divider(
                thickness: 1,
                color: white.withOpacity(0.4),
              ),
          itemCount: imageVlues.length - 15),
    );
  }
}
