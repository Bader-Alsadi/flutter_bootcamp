import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/widgets/custom_hediang.dart';
import 'package:app/services_provider/core/widgets/custom_slider_SP.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(HE_paddding),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/image/index.jpeg")),
          ),
          title: Text("Dashborad"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(HE_paddding),
              child: SvgPicture.asset(
                  "assets/svg_image/bell-bing-svgrepo-com.svg"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomHeading(
              title: "Resent",
            ),
            CustomSliderSP(),
            CustomHeading(
              title: "Categories",
            ),
            Wrap(
              spacing: 25,
              runSpacing: 15,
              children: List.generate(
                  6,
                  (index) => Container(
                        padding: EdgeInsets.all(HE_paddding * 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/driver.svg",
                              height: 60,
                            ),
                            SizedBox(
                              height: HE_paddding,
                            ),
                            Text("Driver"),
                          ],
                        ),
                      )),
            ),
            SizedBox(
              height: HE_paddding * 3,
            ),
            CustomHeading(
              title: "Top Rating",
            ),
            SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, Index) => Card(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * .95,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/image/index.jpeg",
                                  height: 80,
                                  width: 65,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text("bader"),
                              subtitle: Text("programer"),
                              trailing: Column(
                                children: [
                                  Text("5.6"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )))
          ]),
        ),
      ),
    );
  }
}
