import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 15,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hello,bader",
              style: TextStyle(color: Colors.grey[700]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find Deals",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/image/index.jpeg",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Searsh City, Hotels, ect",
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Populer Places",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    "view all",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(5),
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/image/1.jpg"),
                              fit: BoxFit.fill,
                            )),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Populer Experiencer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    "view all",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(5),
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/image/5.jpg"),
                              fit: BoxFit.fill,
                            )),
                      )),
            )
          ]),
        ),
      ),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    var Padding = size.width / 15;
    List<IconData> listic = [
      Icons.foundation_outlined,
      Icons.list_alt_rounded,
      Icons.cabin,
      Icons.star_border_outlined,
    ];

    return Container(
        padding: EdgeInsets.all(Padding),
        decoration: BoxDecoration(
            color: primary,
            boxShadow: [BoxShadow(offset: Offset(0, -1), blurRadius: 1)]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => Icon(
                      listic[index],
                      color: Colors.black,
                    ))));
  }
}
