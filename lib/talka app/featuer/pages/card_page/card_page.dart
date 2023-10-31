import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_card_itme.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_heading.dart';
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
