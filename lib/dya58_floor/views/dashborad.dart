import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/course/show_course.dart';
import 'package:app/dya58_floor/views/data/dashborad_data.dart';
import 'package:app/dya58_floor/views/department/show_dapartment.dart';
import 'package:app/dya58_floor/views/student_pahe/student_show.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          color: white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg_image/bell-bing-svgrepo-com.svg",
              height: 30,
              colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
            ),
          )
        ],
        backgroundColor: secondry,
        title: Text(
          "Dashborad",
          style: TextStyle(color: white),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: DashboardClipper(),
                    child: Container(
                      color: secondry,
                      height: MediaQuery.sizeOf(context).height * .3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: miniSpacer),
                    height: MediaQuery.sizeOf(context).height * .25,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 30,
                          color: black.withOpacity(0.2),
                          // spreadRadius: 3,
                        ),
                      ],
                      color: white,
                      borderRadius: BorderRadius.circular(radio),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/image/index.jpeg"),
                          ),
                          SizedBox(
                            height: minPadding,
                          ),
                          Text(
                            "Bader alsadi",
                            style: subTitle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(miniSpacer),
                child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    axisDirection: AxisDirection.down,
                    children: dashBorad_data
                        .map(
                          (e) => NewWidget(
                            navigotor: e["navigotor"],
                            lable: e["title"],
                            count: e["count"],
                            svg_path: e["svg_path"],
                            index: dashBorad_data.indexOf(e),
                          ),
                        )
                        .toList()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  NewWidget({
    required this.count,
    required this.lable,
    required this.svg_path,
    required this.navigotor,
    required this.index,
    super.key,
  });
  int count;
  String svg_path, lable, navigotor;
  int index;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: widget.count,
      mainAxisCellCount: 1,
      child: InkWell(
        onTap: () async {
          await Navigator.pushNamed(context, widget.navigotor);
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 40,
                color: black.withOpacity(0.2),
                // spreadRadius: 3,
              ),
            ],
            color: white,
            borderRadius: BorderRadius.circular(radio),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.svg_path,
                height: 70,
                colorFilter: ColorFilter.mode(secondry, BlendMode.srcIn),
              ),
              Text(
                widget.lable,
                style: subTitle,
              ),
              Divider(
                endIndent: 20,
                thickness: 1,
                indent: 20,
                color: secondry.withOpacity(0.3),
              ),
              FutureBuilder(
                  future: widget.index == 0
                      ? DBhelper.databse.aggragtion.countStident()
                      : widget.index == 1
                          ? DBhelper.databse.aggragtion.countDepartment()
                          : DBhelper.databse.aggragtion.countCourse(),
                  builder: (contect, snapshot) {
                    if (snapshot.hasData) {
                      return Text("number : ${snapshot.data}",
                          style: subTitle.copyWith(color: secondry));
                    } else {
                      return Text("number : 0");
                    }
                  })
            ],
          ),
        ),
      ),
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


// Container(
//         margin: EdgeInsets.symmetric(horizontal: miniSpacer),
//         padding: EdgeInsets.all(minPadding),
//         // width: MediaQuery.sizeOf(context).width,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 2),
//               blurRadius: 40,
//               color: black.withOpacity(0.3),
//               // spreadRadius: 3,
//             ),
//           ],
//           color: white,
//           borderRadius: BorderRadius.circular(radio),
//         ),
//         child: