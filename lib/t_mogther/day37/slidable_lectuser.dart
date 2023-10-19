import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlidabLectuer extends StatefulWidget {
  const SlidabLectuer({super.key});

  @override
  State<SlidabLectuer> createState() => _SlidabLectuerState();
}

class _SlidabLectuerState extends State<SlidabLectuer> {
  bool isExpande = false;
  List<bool> expande = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("slidable".toUpperCase()),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
              expansionCallback: (index, ex) {
                expande = expande.map((e) {
                  e = false;
                  return e;
                }).toList();
                expande[index] = ex;
                expande.forEach(
                  (element) {},
                );
                setState(() {});
              },
              children: List.generate(
                expande.length,
                (index) => ExpansionPanel(
                    isExpanded: expande[index],
                    canTapOnHeader: false,
                    headerBuilder: (contex, ex) {
                      return Text("item");
                    },
                    body: Column(
                        children: List.generate(
                      5,
                      (index) => Slidable(
                          startActionPane: ActionPane(
                            // A motion is a widget used to control how the pane animates.
                            motion: const ScrollMotion(),

                            // A pane can dismiss the Slidable.
                            dismissible: DismissiblePane(onDismissed: () {}),

                            // All actions are defined in the children parameter.
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: null,
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.deleteLeft,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: null,
                                backgroundColor: Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.share,
                                label: 'Share',
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text("bader"),
                          )),
                    ))),
              )),
        ));
  }
}
