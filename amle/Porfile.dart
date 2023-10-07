
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Porfile extends StatelessWidget {
  List<String>listAmge=["assets/image/index.jpeg"
    ,"assets/image/index.jpeg",
    "assets/image/index.jpeg"];
  // const Porfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>listAmge=["assets/image/index.jpeg"
      ,"assets/image/index.jpeg",
      "assets/image/index.jpeg"];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ProFileImage(radius: 40, imagePath: "assets/image/index.jpeg"),
                titleAndsuptitle(title: "5", subTitle: "post"),
                titleAndsuptitle(title: "51M", subTitle: "followers"),
                titleAndsuptitle(title: "1", subTitle: "following"),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            children: [
              bio(
                  name: "Bader Alsadi",
                  mojar: "BackEnd Devloper",
                  about:
                      "use ur smalie to change the world dont let the world change ue smaile"),
            ],
          ),
          Divider(
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          Container(
            height: 150 ,
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
              ),
              itemCount: listAmge.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(listAmge[index]),
                      fit: BoxFit.cover,
                    )
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget ProFileImage({required double radius, required String imagePath}) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: AssetImage(imagePath),
  );
}

Widget titleAndsuptitle({required String title, required String subTitle}) {
  return Expanded(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
            padding: EdgeInsets.only(top: 7),
            child: Text(
              subTitle,
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
      ],
    ),
  );
}

Widget bio({
  required String name,
  required String mojar,
  required String about,
}) {
  return Container(
    child: Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text(
                  mojar,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )),
            Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text(
                  about,
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                )),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("following")),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "messeges",
                          style: TextStyle(color: Colors.grey),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ])),

          ],
        ),
      ),
    ),
  );
}
