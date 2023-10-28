
import 'package:app/movie_app/core/Data/category_payment_data.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customExpansionpanel extends StatelessWidget {
  const customExpansionpanel({
    super.key,
    required this.selectindex,
  });

  final int selectindex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(children: [
        ExpansionPanelList(
          children: [
            ExpansionPanel(
                headerBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(miniSpacer)
                        .copyWith(bottom: smallSpacer),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataCategotyPayment[selectindex]["title"]),
                        SizedBox(
                          height: smallSpacer,
                        ),
                        Row(children: [
                          Image.asset(
                            dataCategotyPayment[selectindex]["smallImage"],
                            height: 20,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: miniSpacer,
                          ),
                          Text(dataCategotyPayment[selectindex]["number"]),
                        ])
                      ],
                    ),
                  );
                },
                body: Container())
          ],
        )
      ]),
    );
  }
}
