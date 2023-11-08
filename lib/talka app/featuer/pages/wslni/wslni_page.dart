import 'package:app/talka%20app/core/widgets/custom_Float_button.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_delivry_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_from_container.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/core/widgets/custom_to_form.dart';
import 'package:flutter/material.dart';

class WsalinPage extends StatefulWidget {
  const WsalinPage({super.key});

  @override
  State<WsalinPage> createState() => _WsalinPageState();
}

class _WsalinPageState extends State<WsalinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "وصلني").build(context),
        floatingActionButton: customFlotingButton(),
        bottomNavigationBar: CustomContainerBottomNaviction(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomFlotingAppBar(
                height: 100,
                flotingWidgetOnAppBar: CustomContainer(
                  child: Column(
                    children: [
                      CustomFromContainer(),
                      Divider(),
                      CustomTocontainer(),
                    ],
                  ),
                ),
              ),
              CustomDelivryContanier(),
              CustomNotes()
            ],
          ),
        ));
  }
}
