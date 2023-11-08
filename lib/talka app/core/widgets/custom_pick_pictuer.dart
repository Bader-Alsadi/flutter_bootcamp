import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class CustomPickPictuer extends StatelessWidget {
  CustomPickPictuer({super.key, this.title = "صورة مرفقة", this.option = ""});
  String title, option;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            InkWell(
              onTap: () {},
              child: CustomIconContaner(
                svg_path: "assets/svg_image/camera-svgrepo-com.svg",
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(option,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ]),
          Divider(),
          CustomIconContaner(
            padding: 50,
          ),
          SizedBox(
            height: miniSpacer,
          )
        ],
      ),
    );
  }
}
