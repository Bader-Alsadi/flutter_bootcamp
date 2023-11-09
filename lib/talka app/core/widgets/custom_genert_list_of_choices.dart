import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class CustomGenertListOfChocices extends StatelessWidget {
  CustomGenertListOfChocices({super.key, required this.data, this.height});
  List data;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 368,
      child: ListView.separated(
          itemBuilder: (context, index) => index != data.length - 1
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: index > 2
                          ? primary
                          : Color.fromARGB(255, 35, 156, 90),
                      borderRadius: BorderRadius.circular(borderRaduis)),
                  child: ListTile(
                      leading: CustomIconContaner(
                          backgroundColor:
                              index > 2 ? primary : white.withOpacity(0.15)),
                      title: Text(data[index]),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: index > 2 ? black : white,
                      )),
                )
              : Row(
                  children: [
                    Spacer(),
                    CustomIconContaner(),
                    SizedBox(
                      width: smallSpacer,
                    ),
                    CustomIconContaner(),
                    Spacer(),
                  ],
                ),
          separatorBuilder: (_, __) => SizedBox(
                height: miniSpacer,
              ),
          itemCount: data.length),
    );
  }
}
