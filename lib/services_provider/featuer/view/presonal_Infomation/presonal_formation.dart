import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

class Presonal_infomation extends StatefulWidget {
  const Presonal_infomation({super.key});

  @override
  State<Presonal_infomation> createState() => _Presonal_infomationState();
}

class _Presonal_infomationState extends State<Presonal_infomation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "PROFILE",
          style: title.copyWith(fontSize: 25, color: white),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.all(HE_paddding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: DashboardClipper(),
                    child: Container(
                      color: primary,
                      height: MediaQuery.sizeOf(context).height * .3,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.camera,
                            color: primary,
                          )),
                      radius: 45,
                      backgroundImage: AssetImage("assets/image/index.jpeg"),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(HE_paddding),
                child: Column(
                  children: [
                    CustomTextFiled(
                      lable: "Name",
                    ),
                    SizedBox(
                      height: HE_paddding * 2,
                    ),
                    CustomTextFiled(
                      lable: "Phone",
                    ),
                    SizedBox(
                      height: HE_paddding * 2,
                    ),
                    CustomTextFiled(
                      lable: "Email;",
                    ),
                    SizedBox(
                      height: HE_paddding * 2,
                    ),
                    CustomTextFiled(
                      lable: "Career",
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 130, bottom: 10),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("save"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    this.lable = "",
    super.key,
  });

  String lable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: Text(lable),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}

class DashboardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height * .8, size.width, size.height / 2);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
