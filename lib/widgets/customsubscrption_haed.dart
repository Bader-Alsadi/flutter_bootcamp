import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/material.dart';

class customSubscrptionHeading extends StatelessWidget {
  const customSubscrptionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer).copyWith(top: smallSpacer),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                    "choose the plan that's right for you".toUpperCase(),
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: miniSpacer,
              ),
              Text(
                "Downgrade or Upgrade for any time",
                style: TextStyle(color: white, fontSize: 11),
              ),
            ],
          ),
          Text(
            "Coutom your plan",
            style: TextStyle(color: yellow),
          )
        ],
      ),
    );
  }
}
