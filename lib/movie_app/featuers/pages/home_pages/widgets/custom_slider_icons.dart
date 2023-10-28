import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

int selectIndex = 0;

class CustomIconSlider extends StatefulWidget {
  CustomIconSlider({
    super.key,
    required this.listIcons,
  });
  List listIcons;

  @override
  State<CustomIconSlider> createState() => _CustomIconSliderState();
}

class _CustomIconSliderState extends State<CustomIconSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: primary,
      margin: EdgeInsets.only(top: miniSpacer),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: widget.listIcons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  selectIndex = index;
                  print(selectIndex);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: appPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.listIcons[index]["Icon"]!,
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.listIcons[index]["name"]!.toUpperCase(),
                        style: TextStyle(color: white),
                      ),
                      SizedBox(
                        height: miniSpacer / 2,
                      ),
                      selectIndex == index
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(
                                color: yellow,
                              ))
                          : Container(),
                    ],
                  ),
                ),
              )),
    );
  }
}
