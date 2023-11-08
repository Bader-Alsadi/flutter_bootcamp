import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_card_itme.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_heading.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/core/widgets/custom_image_raduis.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/featuer/pages/card_page/widgets/custom_floating_contenier.dart';
import 'package:app/talka%20app/featuer/pages/card_page/widgets/custom_triling.dart';
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
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          color: secondary,
          child: Stack(children: [
            Positioned(
                left: 30,
                top: 50,
                child: CustomIconContaner(
                  svg_color: white,
                  backgroundColor: white.withOpacity(0.5),
                  svg_path: "assets/svg_image/bin-svgrepo-com.svg",
                  padding: 20,
                )),
            Positioned(
                right: 30,
                top: 60,
                child: Text(
                  "السلة",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: white, fontSize: 20),
                ))
          ]),
        ),
      ),
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomFlotingAppBar(
                flotingWidgetOnAppBar: CustomContainer(
                    child: CustomFlotingContainer(
                  imageWidget: CutstomImageWithRaduis(),
                )),
              ),
              CustomContainer(
                child: Column(
                  children: [
                    CustomHeading(
                      heading: "العناصر المضافة ",
                      svg_path: "assets/svg_image/bag-1-svgrepo-com.svg",
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
              CustomNotes()
            ],
          ),
        ),
      ),
    );
  }
}
