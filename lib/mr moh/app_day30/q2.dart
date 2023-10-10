import 'package:flutter/material.dart';

class ShowInfo extends StatefulWidget {
  const ShowInfo({super.key});

  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  List<Corsec> listc = [
    Corsec(name: "Ai", nHouer: 3, department: "CT"),
    Corsec(name: "Dart", nHouer: 3, department: "IT"),
    Corsec(name: "Flutter", nHouer: 3, department: "Cs"),
  ];

  String ItmeDrop = "Ai";
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 80,
                  width: 100,
                  child: DropdownButton(
                      value: ItmeDrop,
                      items: List.generate(
                          listc.length,
                          (index) => DropdownMenuItem(
                                child: Text("${listc[index].name}"),
                                value: listc[index].name,
                              )),
                      onChanged: (x) {
                        ItmeDrop = x!;
                        setState(() {});
                      })),
              ElevatedButton(
                  onPressed: () {
                    currentItem =
                        listc.indexWhere((element) => element.name == ItmeDrop);
                    setState(() {});
                  },
                  child: Text("get info")),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Text(
              "${listc[currentItem].name}-${listc[currentItem].nHouer}-${listc[currentItem].department}"),
        ],
      ),
    );
  }
}

class Corsec {
  late String name, department;
  late int nHouer;

  Corsec({required this.name, required this.nHouer, required this.department});
}
