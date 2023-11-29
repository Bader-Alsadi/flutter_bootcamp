import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notfiction_page extends StatefulWidget {
  const Notfiction_page({super.key});

  @override
  State<Notfiction_page> createState() => _Notfiction_pageState();
}

class _Notfiction_pageState extends State<Notfiction_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "Notfiction",
          style: title.copyWith(fontSize: 25, color: white),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Card(
                margin:
                    EdgeInsets.symmetric(horizontal: HE_paddding, vertical: 50)
                        .copyWith(bottom: 0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/svg_image/bell-bing-svgrepo-com.svg",
                      colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
                    ),
                    title: Text("bader"),
                    subtitle: Column(
                      children: [
                        Text(
                            "i had proble in thie service i had proble in thie service i had proble in thie service"),
                        TextFormField()
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, __) => SizedBox(
                height: HE_paddding,
              ),
          itemCount: 3),
    );
  }
}
