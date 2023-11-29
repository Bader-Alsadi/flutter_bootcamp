import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

class settingsView
 extends StatefulWidget {
  const settingsView
  ({super.key});

  @override
  State<settingsView> createState() => _Profile_viewState();
}

class _Profile_viewState extends State<settingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/image/index.jpeg"),
              ),
              SizedBox(
                height: spaser,
              ),
              SizedBox(
                // width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * .55,
                child: ListView.separated(
                    itemBuilder: (context, index) => rowSittingSP(
                          lable: "Presonal Information",
                        ),
                    separatorBuilder: (_, __) => SizedBox(
                          height: HE_paddding,
                        ),
                    itemCount: 5),
              ),
              rowSittingSP(
                color: primary,
                lable: "Presonal Information",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class rowSittingSP extends StatelessWidget {
  rowSittingSP({super.key, this.lable = "", this.color = null});
  String lable;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: HE_paddding),
      padding: EdgeInsets.all(HE_paddding),
      decoration: BoxDecoration(
        color: color ?? secondry.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          lable,
          style: title.copyWith(color: color == null ? black : white),
        ),
        trailing: Icon(
          Icons.arrow_circle_right_rounded,
          color: color == null ? primary : white,
        ),
      ),
    );
  }
}
