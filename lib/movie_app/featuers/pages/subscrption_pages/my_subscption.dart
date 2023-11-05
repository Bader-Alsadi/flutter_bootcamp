import 'package:app/movie_app/core/Data/data_mysubscption.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/featuers/pages/subscrption_pages/widgets/custo_head_and_value.dart';
import 'package:app/movie_app/featuers/pages/subscrption_pages/widgets/custom_row_with_switsh.dart';
import 'package:flutter/material.dart';

class MySubscption extends StatefulWidget {
  const MySubscption({super.key});

  @override
  State<MySubscption> createState() => _MySubscptionState();
}

class _MySubscptionState extends State<MySubscption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: customAppBar(
            title: "MY subscptions",
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(miniSpacer).copyWith(top: smallSpacer),
          child: Column(
            children: List.generate(
                mySubscptionData.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, category);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: miniSpacer),
                        height: MediaQuery.sizeOf(context).height / 4,
                        padding: EdgeInsets.all(miniSpacer),
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            CustoumRowWithSwitsh(
                              active: mySubscptionData[index]["active"],
                              valueSwitsh: mySubscptionData[index]
                                  ["switchValue"],
                              title: mySubscptionData[index]["state"],
                            ),
                            ListTile(
                              title: Text(
                                mySubscptionData[index]["title"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              subtitle: Text(
                                  "Subscrption ID: ${mySubscptionData[index]["id"]}"),
                            ),
                            Divider(
                              thickness: 2,
                              color: black.withOpacity(0.2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  3, (index) => CustomHeadAndValue()),
                            )
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
