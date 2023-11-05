import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/custom_image_with_rating_bar.dart';
import 'package:app/movie_app/featuers/pages/wish_list_page/widgets/custom_head_with_icon_triler.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: customAppBar(
            title: "Wish list",
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedFontSize: 20,
          backgroundColor: divider,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite_border_outlined,
                color: yellow,
              ),
              icon: Icon(
                Icons.favorite_border_outlined,
                color: white.withOpacity(0.4),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_max_rounded,
                color: yellow,
              ),
              icon: Icon(
                Icons.home_max_rounded,
                color: white.withOpacity(0.4),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.notifications_active_outlined,
                color: yellow,
              ),
              icon: Icon(
                Icons.notifications_active_outlined,
                color: white.withOpacity(0.4),
              ),
              label: "",
            )
          ]),
      body:
          true //to check if there any item will display theme or will show empty list
              ? wishListItem(context)
              : wishListEmpty(),
    );
  }

  Container wishListEmpty() {
    return Container(
      padding: EdgeInsets.all(spacer),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.list_outlined,
            color: yellow,
            size: 150,
          ),
          Text(
            "Your List is Empty".toUpperCase(),
            style: TextStyle(
                color: white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: miniSpacer,
          ),
          Text(
            "countary to popluer belife,  lorem Ipsum is not simply rand"
                .toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white.withOpacity(0.4),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }

  Container wishListItem(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: miniSpacer),
        child: Column(
          children: [
            CustomHeadWithIconTriler(),
            CustomImageWithRatingBar(),
          ],
        ));
  }
}
