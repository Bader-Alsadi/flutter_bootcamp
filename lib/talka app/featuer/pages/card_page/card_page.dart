import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89),
        child: Container(
          color: secondary,
        ),
      ),
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomFlotingAppBar(
                flotingWidgetOnAppBar: CustomFlotingContainer(),
              ),
              CustomContainer(
                child: Column(
                  children: [
                    CustomHeading(
                      heading: "العناصر المضافة ",
                      icon: Icon(Icons.card_travel_rounded),
                      triling: CustomTrlingWidgets(),
                    ),
                    Divider(),
                    Column(
                        children: List.generate(
                      4,
                      (index) => Column(
                        children: [CustomCardItem(), Divider()],
                      ),
                    ))
                  ],
                ),
              ),
              CoutomNotes()
            ],
          ),
        ),
      ),
    );
  }
}

class CoutomNotes extends StatelessWidget {
  const CoutomNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(children: [
        CustomHeading(
          heading: "ملاحظات",
          icon: Icon(Icons.note),
        ),
        Divider(),
        Container(
          decoration: BoxDecoration(color: primary),
          child: TextField(
            maxLines: 7,
            decoration: InputDecoration(
                hintText: "هل هناك شي تريد ان تخبرنا به",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondary),
                    borderRadius:
                        BorderRadius.circular(borderRaduis))),
          ),
        )
      ]),
    );
  }
}

class CustomHeading extends StatelessWidget {
  CustomHeading(
      {super.key,
      this.heading = "لا يوجد نص",
      this.icon = null,
      this.triling = null});
  String heading;
  Icon? icon;
  Widget? triling;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon == null ? Icon(Icons.cancel) : icon!,
        Text(heading),
        Spacer(),
        triling == null ? Container() : triling!
      ],
    );
  }
}

class CustomTrlingWidgets extends StatelessWidget {
  const CustomTrlingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          CustomIcon(
            icon: Icons.lock_clock,
          ),
          Text("أضافة المزيد")
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.child = null,
  });
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer),
      margin: EdgeInsets.all(miniSpacer * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis), color: white),
      width: MediaQuery.sizeOf(context).width,
      child: child == null ? Center(child: Text("no child")) : child,
    );
  }
}

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CutstomImageWithRaduis(
              height: 60,
              width: 55,
            ),
            Positioned(
              bottom: 48,
              left: 41,
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          width: miniSpacer,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("يسبشثصب سيبشثقل سيبشصث سبصشب"),
            CustomText(
              text: "يسبشثصب سيبشثقل سيبشصث سبصشب",
            ),
            Row(
              children: [
                CustomText(
                  text: "1200 ري",
                ),
                SizedBox(
                  width: spacer * 2,
                ),
                Row(
                  children: [
                    CustomIconContaner(
                      borderRAdiusValue: 10,
                      icon: Icons.add,
                      height: 30,
                      iconColor: white,
                      size: 15,
                      padding: 11,
                      backgroundColor: orange,
                    ),
                    Text("     2     "),
                    CustomIconContaner(
                      borderRAdiusValue: 10,
                      icon: Icons.remove,
                      height: 30,
                      iconColor: orange,
                      size: 15,
                      padding: 11,
                      backgroundColor: orange.withOpacity(0.2),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class CustomFlotingContainer extends StatelessWidget {
  const CustomFlotingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CutstomImageWithRaduis(),
          SizedBox(
            width: miniSpacer,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("dsvkdsfgjnvds;klfnvfsdkjlfN:Vdskv"),
              SizedBox(
                height: 5,
              ),
              CustomText(text: "dsvkdsfgjnvds;klfnvfsdkjlfN:Vdskv"),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                CustomIcon(
                  icon: Icons.star,
                  colorIcon: Colors.amber,
                ),
                CustomText(
                  text: " 3.3 (3) ",
                ),
                CustomIcon(
                  icon: Icons.circle_rounded,
                  size: 8,
                ),
                CustomIcon(
                  icon: Icons.location_on_outlined,
                ),
                CustomText(
                  text: " 0.0 كيلو ",
                ),
                CustomIcon(
                  icon: Icons.circle_rounded,
                  size: 8,
                ),
                CustomIcon(
                  icon: Icons.lock_clock,
                ),
                CustomText(
                  text: " 60-40 دقيقة",
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}

class CutstomImageWithRaduis extends StatelessWidget {
  CutstomImageWithRaduis(
      {super.key,
      this.height = 80,
      this.width = 70,
      this.borderRAdiusValue = borderRaduis,
      this.source = "assets/image/4.jpg"});
  double height, width, borderRAdiusValue;
  String source;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRAdiusValue),
      child: Image.asset(
        source,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    this.text = " ",
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey),
    );
  }
}

class CustomIcon extends StatelessWidget {
  CustomIcon({
    super.key,
    this.icon = Icons.abc,
    this.colorIcon = Colors.grey,
    this.size = 20,
  });
  IconData icon;
  Color colorIcon;
  double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: colorIcon,
      size: size,
    );
  }
}
