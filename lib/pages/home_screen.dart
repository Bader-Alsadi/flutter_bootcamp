import 'package:app/Data/buttonValue.dart';
import 'package:app/Data/icon_bar_data.dart';
import 'package:app/Data/image_value.dart';
import 'package:app/Data/list_movies.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/utlis/assetsI_image.dart';
import 'package:app/widgets/custom_divider.dart';
import 'package:app/widgets/custom_heading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String Route = homeScreen;

  @override
  State<HomeScreen> createState() => _MainPageState();
}

class _MainPageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondary,
        appBar: customAppBar(),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSlider(
                imageVlue: imageVlues,
              ),
              customIconSlider(context, listIcons: listIconsBar),
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

  PreferredSize customAppBar() {
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
}

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
            onTap: (){
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

class customSlider extends StatelessWidget {
  customSlider({super.key, required this.imageVlue});
  List<String> imageVlue;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageVlue.length,
        itemBuilder: (_, index, index2) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageVlue[index],
                fit: BoxFit.fill,
                width: 270,
              ),
            ),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4 - 40,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }
}
