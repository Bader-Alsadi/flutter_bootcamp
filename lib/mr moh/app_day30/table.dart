import 'package:app/mr%20moh/app_day30/regsted.dart';
import 'package:flutter/material.dart';

class TableDart extends StatefulWidget {
  List<Regsted> regestd = [];
  // Regsted rg;
  TableDart({required this.regestd, super.key}) {}

  @override
  State<TableDart> createState() => _TableDartState();
}

class _TableDartState extends State<TableDart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.read_more),
      ),
      body: Container(
        child: Table(
            border: TableBorder.all(width: 1),
            children: List.generate(
                widget.regestd.length,
                (index) => TableRow(children: [
                      TableCell(child: Text("${widget.regestd[index].name}")),
                      TableCell(child: Text("${widget.regestd[index].phone}")),
                      TableCell(
                          child: Text("${widget.regestd[index].passwprd}")),
                    ]))),
      ),
    ));
  }
}
