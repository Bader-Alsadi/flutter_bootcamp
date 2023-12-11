import 'package:app/services_provider/core/helper/db_helper.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_hediang.dart';
import 'package:app/services_provider/core/widgets/custom_slider_SP.dart';
import 'package:app/services_provider/core/widgets/image_crical.dart';
import 'package:app/services_provider/featuer/view/presonal_Infomation/presonal_formation.dart';
import 'package:app/services_provider/featuer/view/profile_page/profile_page.dart';
import 'package:app/services_provider/featuer/view/welcom_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  Dashboard({
    super.key,
  });

  static const String ROUTE = "dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List svg_paths = [
    {
      "name": "معلومات شخصية",
      "svg-path": "assets/svg_image/icons/user.svg",
      "nav": PresonalInfomation.ROUTE,
    },
    {
      "name": "اعدادت",
      "svg-path": "assets/svg_image/icons/setting.svg",
      "nav": PresonalInfomation.ROUTE
    },
    {
      "name": "تسجيل الخروج",
      "svg-path": "assets/svg_image/icons/logout.svg",
      "nav": WelcomePage.ROUTE
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(HE_paddding),
              child: Builder(
                builder: (context) => InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/image/index.jpeg")),
                ),
              ),
            ),
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/logoSP.png",
                height: 40,
                // width: 50,
              ),
              Text("منفعة", style: title),
            ]),
            centerTitle: true,
            actions: [
              Padding(
                  padding: EdgeInsets.all(HE_paddding),
                  child: Icon(
                    Icons.circle,
                    color: COLOR_PRIMARY,
                  )),
              Padding(
                  padding: EdgeInsets.all(HE_paddding),
                  child: isDarkMode(context)
                      ? Icon(
                          Icons.dark_mode,
                          color: white,
                        )
                      : Icon(
                          Icons.light_mode,
                          color: black,
                        )),
            ],
          ),
          drawer: drawerFun(context),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              // decoration:
              //     BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
              child: Column(children: [
                CustomHeading(
                  title: "حديث",
                ),
                CustomSliderSP(),
                CustomHeading(
                  title: "اصناف",
                ),
                FutureBuilder(
                    future: DBhelper.database.categoryDao.getAllcategory(),
                    builder: (context, snapshot) {
                      if (snapshot.data!.isNotEmpty) {
                        return Wrap(
                          spacing: 25,
                          runSpacing: 15,
                          children: List.generate(
                              snapshot.data!.length,
                              (index) => Container(
                                    padding: EdgeInsets.all(HE_paddding * 2),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: gradientColors,
                                      ),
                                      color: secondry,
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
                                        Text(snapshot
                                            .data![index].category_name),
                                      ],
                                    ),
                                  )),
                        );
                      } else {
                        return Center(
                          child: Text("لا توجد بيانات"),
                        );
                      }
                    }),
                SizedBox(
                  height: HE_paddding * 3,
                ),
                CustomHeading(
                  title: "اعلى تقيم",
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
                                  title: Text(
                                    "بدر السعدي",
                                    style: normalTextbold,
                                  ),
                                  subtitle: Text(
                                    "مبرمج",
                                    style: normalText.copyWith(
                                        color: black.withOpacity(0.5)),
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text(
                                        "5.6",
                                        style: normalTextbold,
                                      ),
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
        ),
      ),
    );
  }

  Drawer drawerFun(BuildContext context) {
    return Drawer(
      backgroundColor: COLOR_PRIMARY.withOpacity(0.7),
      child: ListView(
        children: [
          SizedBox(
            height: spaser,
          ),
          Align(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.ROUTE);
              },
              child: ImageCrical(
                size: Size(100, 100),
              ),
            ),
          ),
          SizedBox(
            height: spaser / 2,
          ),
          Divider(
            thickness: 2,
            color: white,
          ),
          for (int i = 0; i < svg_paths.length; i++)
            ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  svg_paths[i]["nav"],
                );
              },
              leading: SvgPicture.asset(svg_paths[i]["svg-path"],
                  colorFilter: ColorFilter.mode(white, BlendMode.srcIn)),
              trailing: Icon(
                Icons.arrow_right,
                color: white,
              ),
              title: Text(
                svg_paths[i]["name"],
                style: normalTextbold.copyWith(color: white),
              ),
            ),
        ],
      ),
    );
  }
}
