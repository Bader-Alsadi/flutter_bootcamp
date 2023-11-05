import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class TalkaPlusPage extends StatefulWidget {
  const TalkaPlusPage({super.key});

  @override
  State<TalkaPlusPage> createState() => _TalkaPlusPageState();
}

class _TalkaPlusPageState extends State<TalkaPlusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: secondary,
          child: SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 25,
                  child: CustomIconContaner(
                    svg_color: white,
                    backgroundColor: white.withOpacity(0.3),
                    svg_path: "assets/svg_image/right-svgrepo-com.svg",
                    padding: 20,
                  ),
                ),
                Center(
                    child: Text(
                  "\n طلقة بلس ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: white, fontSize: 20),
                ))
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: smallSpacer),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomFlotingAppBar(
                    height: 100,
                    flotingWidgetOnAppBar: CustomContainer(
                      child: Column(
                        children: [
                          CustomSettingRow(
                            svg_path: "assets/svg_image/pin-svgrepo-com.svg",
                            title: "من",
                            subTitle: "_______",
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          CustomSettingRow(
                            svg_path: "assets/svg_image/pin-svgrepo-com.svg",
                            title: "الى",
                            subTitle: "مكاني",
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomContainer(
                    child: CustomSettingRow(
                      svg_path: "assets/svg_image/pin-svgrepo-com.svg",
                      title: "نوع المنقولات",
                      subTitle: "كسر",
                    ),
                  ),
                  CustomContainer(
                    child: CustomSettingRow(
                      svg_path: "assets/svg_image/pin-svgrepo-com.svg",
                      title: "وسيلة التوصيل ",
                      subTitle: "درجة",
                    ),
                  ),
                  CoutomNotes(),
                  CustomContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheet(
                                        onClosing: () {},
                                        builder: (context) {
                                          return Container();
                                        });
                                  });
                            },
                            child: CustomIconContaner(
                              svg_path:
                                  "assets/svg_image/camera-svgrepo-com.svg",
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Text("  صورة مرفقة",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("(اختياري)",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Divider(),
                        CustomIconContaner(
                          padding: 50,
                        ),
                        SizedBox(
                          height: miniSpacer,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
