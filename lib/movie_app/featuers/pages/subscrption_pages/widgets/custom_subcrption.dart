import 'package:app/movie_app/core/Data/subscrption_page_data.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomSubcrpitionValue extends StatelessWidget {
  const CustomSubcrpitionValue({
    super.key,
    required this.slsetcedIndex,
  });

  final int slsetcedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          listPaiment.length,
          (index) => Column(
                children: List.generate(
                    listPaiment[index].length,
                    (inde) => Container(
                          margin: EdgeInsets.only(top: miniSpacer),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 60,
                          child: Column(
                            children: [
                              Text(
                                "${listPaiment[index][inde]["name"]}",
                                style: TextStyle(
                                    color: slsetcedIndex == index
                                        ? white
                                        : white.withOpacity(0.3)),
                              ),
                              SizedBox(
                                height: miniSpacer - 5,
                              ),
                              Text("${listPaiment[index][inde]["price"]}",
                                  style: TextStyle(
                                      color: slsetcedIndex == index
                                          ? yellow
                                          : yellow.withOpacity(0.3))),
                              Divider(
                                endIndent:
                                    (MediaQuery.of(context).size.width / 3) /
                                            2 -
                                        smallSpacer +
                                        5,
                                indent:
                                    (MediaQuery.of(context).size.width / 3) /
                                            2 -
                                        smallSpacer +
                                        5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )),
              )),
    );
  }
}
