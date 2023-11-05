import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_image_raduis.dart';
import 'package:app/talka%20app/featuer/pages/card_page/widgets/custom_floating_contenier.dart';
import 'package:app/talka%20app/featuer/pages/card_page/widgets/custom_triling.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
        child: Column(
          children: [
            CustomFlotingAppBar(
              height: 50,
              flotingWidgetOnAppBar: CustomContainer(
                  child: NavigationBar(destinations: [
                CustomTrlingWidgets(),
                CustomTrlingWidgets(),
              ])),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.builder(
                itemBuilder: (context, index) => Stack(
                  children: [
                    CustomContainer(
                        child: CustomFlotingContainer(
                      imageWidget: CutstomImageWithRaduis(
                        borderRAdiusValue: 35,
                        height: 70,
                        width: 70,
                      ),
                    )),
                    Positioned(
                      left: 25,
                      top: 25,
                      child: Icon(
                        Icons.cancel,
                        color: secondary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
