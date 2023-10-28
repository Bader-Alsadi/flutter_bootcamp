import 'package:app/movie_app/core/Data/data_notivction.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/featuers/pages/notevction_page/widgets/custom_notefaction_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotiFactionPage extends StatefulWidget {
  const NotiFactionPage({super.key});

  @override
  State<NotiFactionPage> createState() => _NotivctionPageState();
}

class _NotivctionPageState extends State<NotiFactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: customAppBar(
            title: "NotiFactionPage",
          )),
      body: Container(
        padding: EdgeInsets.all(miniSpacer).copyWith(top: smallSpacer),
        child: ListView.separated(
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataNotivction.keys.toList()[index]),
                    SizedBox(
                      height: miniSpacer,
                    ),
                    Column(
                      children: List.generate(
                        dataNotivction[dataNotivction.keys.toList()[index]]!
                            .length,
                        (ind) => Column(
                          children: [
                            CustomNotefactionRow(
                              name: dataNotivction[dataNotivction.keys
                                  .toList()[index]]![ind]["noteName"],
                              descrption: dataNotivction[dataNotivction.keys
                                  .toList()[index]]![ind]["noteDescrption"],
                              time: dataNotivction[dataNotivction.keys
                                  .toList()[index]]![ind]["noteTime"],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            separatorBuilder: (_, __) => SizedBox(
                  height: spacer,
                ),
            itemCount: dataNotivction.length),
      ),
    );
  }
}
