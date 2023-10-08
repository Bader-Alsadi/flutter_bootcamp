import 'package:flutter/material.dart';

class ConvortConst extends StatefulWidget {
  const ConvortConst({super.key});

  @override
  State<ConvortConst> createState() => _ConvortConstState();
}

class _ConvortConstState extends State<ConvortConst> {
  double convortContst = 0.0;
  int SelectGro = 1;
  TextEditingController textCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: textCon,
            ),
            RadioListTile(
                value: 1,
                title: Text("Ry"),
                groupValue: SelectGro,
                onChanged: (v) {
                  SelectGro = v!;
                  convortContst = double.parse(textCon.text) * 350.0;
                  setState(() {});
                }),
            RadioListTile(
                value: 2,
                title: Text("Rs"),
                groupValue: SelectGro,
                onChanged: (v) {
                  SelectGro = v!;
                  convortContst = double.parse(textCon.text) / 350.0;
                  setState(() {});
                }),
            SizedBox(
              height: 40,
            ),
            Text(
                "${convortContst.toStringAsFixed(2)}  ${SelectGro == 1 ? "Ry" : "Rs"}"),
          ],
        ),
      ),
    ));
  }
}
