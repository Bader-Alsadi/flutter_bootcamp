import 'package:app/movie_app/core/Data/data_darwer.dart';
import 'package:app/movie_app/core/Data/icon_bar_data.dart';
import 'package:app/movie_app/core/Data/image_value.dart';
import 'package:app/movie_app/core/Data/list_movies.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/widgets/custom_movies_slider.dart';
import 'package:app/movie_app/featuers/pages/home_pages/widgets/custom_main_app_bar.dart';
import 'package:app/movie_app/featuers/pages/home_pages/widgets/custom_slider_icons.dart';
import 'package:app/movie_app/featuers/pages/home_pages/widgets/custom_top_slider.dart';
import 'package:app/movie_app/core/widgets/custom_divider.dart';
import 'package:app/movie_app/core/widgets/custom_heading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainPageState();
}

class _MainPageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: primary,
                child: UserAccountsDrawerHeader(
                    accountEmail: null,
                    accountName: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/image/index.jpeg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("bader alsadi"),
                            Text("baderalsadi@gmail.com")
                          ],
                        )
                      ],
                    )),
              ),
              for (int i = 0; i < drawerData.length; i++)
                ListTile(
                  leading: drawerData[i]["icon"],
                  title: Text(drawerData[i]["name"]),
                )
            ],
          ),
        ),
        appBar: customAppBar(context),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSlider(
                imageVlue: imageVlues,
              ),
              CustomIconSlider(
                listIcons: listIconsBar,
              ),
              CustomDivider(),
              custoumHeading(
                headingText: "Trading iv vimu",
                trailingText: "see all",
              ),
              customSliderMovie(
                listMovies: listMovies,
              ),
              CustomDivider(),
              custoumHeading(
                headingText: " news",
                trailingText: "see all",
              ),
              customSliderMovie(
                listMovies: listMovies,
              )
            ],
          ),
        )),
      ),
    );
  }
}
