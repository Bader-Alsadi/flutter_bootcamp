import 'package:app/blog_app/core/helper/getStroge/getStroge_he;per.dart';
import 'package:app/blog_app/featuer/viewmodels/artical_vm.dart';
import 'package:app/blog_app/featuer/viewmodels/cimment_vn.dart';
import 'package:app/blog_app/featuer/views/add_artical/add_artical.dart';
import 'package:app/blog_app/featuer/views/errors/errer_page.dart';
import 'package:app/day54/featuer/viewmodels/awards_viewmodels.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/featuer/view/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const String ROUTE = "homepage";
  String name = GetStorageHelper.get_box("user").read("name");
  String tokken = GetStorageHelper.get_box("user").read("token");
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: COLOR_SECONDRY,
              title: Text("welcom my dear $name"),
              elevation: 0,
              actions: [
                InkWell(
                  onTap: () {
                    GetStorageHelper.get_box("user").remove("token");
                    Navigator.pushReplacementNamed(context, login_page.ROUTE);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8).copyWith(top: 5),
                    child: Icon(Icons.logout),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      top: 15.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AddArtical.ROUTE);
                      },
                      child: Consumer<ArticalVM>(
                        builder: (context, length, _) => Badge(
                            label: Text("${length.getleinth()}"),
                            child: Icon(Icons.article_sharp)),
                      ),
                    ))
              ]),
          body: Consumer<ArticalVM>(
            builder: (context, arm, _) => Container(
              height: MediaQuery.sizeOf(context).height,
              padding: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors)),
              child: FutureBuilder(
                  future: arm.featchArticals(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.done) if (snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Card(
                                  child: Column(
                                children: [
                                  // ClipRRect(
                                  //   child: Image.network(
                                  //       snapshot.data![index].image!),
                                  // ),
                                  ListTile(
                                    title: Text(
                                      snapshot.data![index].title!,
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index].content!,
                                    ),
                                  ),
                                  // addCommentpart(
                                  //     context, snapshot.data![index].id!),
                                ],
                              )));
                    } else {
                      return Center(
                        child: Text("no dtae"),
                      );
                    }
                    else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            ),
          )),
    );
  }

  // TextFormField addCommentpart(BuildContext context, int artical_id) {
  //   CommentVM cvm = CommentVM();
  //   return TextFormField(
  //       controller: comment,
  //       decoration: getInputDecoration(
  //         suffixIcon: InkWell(
  //           onTap: () async {
  //             final data = {"comment": comment.text, "article_id": artical_id};
  //             int code = await cvm.addCommnet(data, tokken);
  //             if (code == 1200) {
  //               showSnackBar(context, "comment succssfuly");
  //               Navigator.pushReplacementNamed(context, HomePage.ROUTE);
  //             } else if (code == 1300) {
  //               showSnackBar(context, "falid");
  //             } else if (code == 404) {
  //               Navigator.pushNamed(context, Error404.ROUTE);
  //             } else {
  //               showSnackBar(context, "wronng");
  //             }
  //           },
  //           child: Icon(
  //             Icons.send_rounded,
  //             size: 15,
  //           ),
  //         ),
  //         hint: "comment",
  //         darkMode: isDarkMode(context),
  //         errorColor: Theme.of(context).colorScheme.error,
  //       ));
  // }
}
