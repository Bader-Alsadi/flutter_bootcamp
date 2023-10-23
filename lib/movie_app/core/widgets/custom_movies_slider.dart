import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customSliderMovie extends StatelessWidget {
  customSliderMovie({super.key, required this.listMovies});
  List<Map<String, String>> listMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          itemCount: listMovies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, subscrption);
                },
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            child: Image.asset(listMovies[index]["url"]!,
                                fit: BoxFit.fill, width: 130, height: 170),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          child: Icon(
                            Icons.hd,
                            color: yellow,
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 3,
                          child: RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                size: 15,
                                color: yellow,
                              )),
                              TextSpan(
                                  text: listMovies[index]["rating"]!,
                                  style: TextStyle(fontSize: 12))
                            ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: miniSpacer,
                    ),
                    Container(
                      // height: 200,
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "subtitle",
                                style: TextStyle(color: yellow, fontSize: 11),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
