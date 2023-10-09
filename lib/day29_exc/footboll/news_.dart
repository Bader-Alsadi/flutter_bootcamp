import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(3, (index) => getContainer()),
            ),
          ),
        ),
      ),
    );
  }

  Widget getContainer() {
    var size = MediaQuery.of(context).size;
    var Padding = size.width / 15;
    return Stack(
      children: [
        Container(
            width: size.width,
            height: 220,
            margin: EdgeInsets.all(Padding - 15),
            padding: EdgeInsets.all(Padding - 10),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: black,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                                text: " 4.5 ", style: TextStyle(color: black)),
                            TextSpan(
                                text: ". ",
                                style: TextStyle(color: black, fontSize: 50)),
                            TextSpan(
                                text: "jerey 1 ",
                                style: TextStyle(color: black)),
                          ])),
                          Text(
                            "Cristiano Ronaldo",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: " Forword ",
                                style: TextStyle(color: black)),
                            TextSpan(
                                text: ". ",
                                style: TextStyle(color: black, fontSize: 50)),
                            TextSpan(
                                text: "Portuguese ",
                                style: TextStyle(color: black)),
                          ])),
                        ],
                      ),
                    ),
                    Container(
                      child: RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage("assets/image/index.jpeg"),
                        )),
                        WidgetSpan(
                            child: SizedBox(
                          width: 10,
                        )),
                        WidgetSpan(
                            child: Icon(
                          Icons.arrow_forward_outlined,
                          color: black,
                        )),
                        WidgetSpan(
                            child: SizedBox(
                          width: 10,
                        )),
                        WidgetSpan(
                            child: CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage("assets/image/index.jpeg"),
                        )),
                      ])),
                    )
                  ],
                ),
                Text("Today")
              ],
            )),
        Positioned(
            left: 150, top: 65, child: Image.asset("assets/image/ronny.png")),
      ],
    );
  }
}
