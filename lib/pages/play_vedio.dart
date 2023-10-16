import 'package:app/Data/buttonValue.dart';
import 'package:app/Data/list_movies.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/utlis/assetsI_image.dart';
import 'package:app/widgets/custom_divider.dart';
import 'package:app/widgets/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoer extends StatefulWidget {
  const PlayVideoer({super.key});

  @override
  State<PlayVideoer> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideoer> {
  late VideoPlayerController videoPlayerController;
  late Future<void> initiVidoe;
  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.asset("assets/image/movise/mov.mp4");
    initiVidoe = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(1.0);
    videoPlayerController.play();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: primary,
            leading: Icon(
              Icons.arrow_back,
              color: yellow,
            ),
            title: Text("muje hard".toUpperCase()),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: VideoPlayer(videoPlayerController),
              ),
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "seasoin 1 ", style: TextStyle(color: yellow)),
                  TextSpan(text: "seasoin 1 ", style: TextStyle(color: white)),
                  TextSpan(text: "seasoin 1 ", style: TextStyle(color: white)),
                ])),
              ),
              customSliderMovie(
                listMovies: listMovies,
              ),
              CustomDivider(),
              custoumHeading(
                headingText: "Recommended you",
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
