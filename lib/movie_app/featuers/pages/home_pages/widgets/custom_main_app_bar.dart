import 'package:app/movie_app/core/Data/buttonValue.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/utlis/assetsI_image.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Container(
        padding: EdgeInsets.all(appPadding - 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.filter_list_sharp,
                color: yellow,
                size: 30,
              ),
            ),
            ButtonBar(
                mainAxisSize: MainAxisSize.min,
                buttonPadding: EdgeInsets.symmetric(horizontal: 0),
                children: List.generate(
                  textButtonVale.length,
                  (index) => TextButton(
                    onPressed: null,
                    child: SizedBox(
                      width: 60,
                      child: Text(
                        textButtonVale[index].toUpperCase(),
                        style: TextStyle(color: white, fontSize: 13),
                      ),
                    ),
                  ),
                )),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, editProfile);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("${assetIMG}index.jpeg"),
              ),
            )
          ],
        ),
      ),
    );
  }
