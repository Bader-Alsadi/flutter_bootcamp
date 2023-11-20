import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:flutter/material.dart';

class TextFileCustom extends StatefulWidget {
  TextFileCustom(
      {super.key, this.lable = " ", this.hint = " ", this.controller = null});
  String lable, hint;
  TextEditingController? controller;

  @override
  State<TextFileCustom> createState() => _TextFileCustomState();
}

class _TextFileCustomState extends State<TextFileCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: subTitle,
        ),
        SizedBox(
          height: minPadding,
        ),
        Container(
            height: 50,
            padding: EdgeInsets.all(minPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: primary,
              ),
              borderRadius: BorderRadius.circular(radio),
            ),
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) {
                setState(() {});
              },
            
              autocorrect: true,
              cursorColor: primary,
              cursorHeight: 20,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: hintText,
                border: InputBorder.none,
              ),
            )),
        Text(
          "${widget.lable.split(" ")[1]} empty",
          style: TextStyle(
              color: widget.controller!.text.isEmpty
                  ? Colors.red
                  : Colors.transparent),
        )
      ],
    );
  }
}
