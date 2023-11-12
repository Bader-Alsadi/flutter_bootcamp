import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/main_valus.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class bodyStaggeredGrid extends StatelessWidget {
  const bodyStaggeredGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: miniSpacer * 2, vertical: 5),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          axisDirection: AxisDirection.down,
          children: List.generate(
            mainValues.length,
            (index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, mainValues[index]["navigtror"]);
              },
              child: Container(
                // width: MediaQuery.sizeOf(context).width / 2,
                padding: EdgeInsets.all(15),

                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(borderRaduis)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainValues[index]["title"],
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: miniSpacer,
                    ),
                    Text(
                      mainValues[index]["content"],
                      style: TextStyle(
                          color: black.withOpacity(0.5), fontSize: 13),
                      softWrap: true,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        mainValues[index]["image_path"],
                        height: 80,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
