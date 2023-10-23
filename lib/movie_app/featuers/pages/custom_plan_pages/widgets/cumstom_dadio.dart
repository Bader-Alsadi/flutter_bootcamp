
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';
class CustomRadio extends StatefulWidget {
   CustomRadio ( {required BuildContext context,
      String this.title = "test",
      required this.radioValues,
      required this.groupValue  });
String groupValue,title;
 List<String> radioValues;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radioValues.length > 4
          ? MediaQuery.of(context).size.height / 6.6
          : MediaQuery.of(context).size.height / 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: miniSpacer,
          ),
          Text(
            widget.title.toUpperCase(),
            style: TextStyle(color: white),
          ),
          Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: List.generate(
                  widget.radioValues.length,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 4.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Radio(
                                  value: widget.radioValues[index],
                                  activeColor: yellow,
                                  groupValue: widget.groupValue,
                                  onChanged: (value) {
                                    widget.groupValue = value!;
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.radioValues[index],
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      ))),
        ],
      ),
    );
  }
}
