import 'package:app/Data/image_value.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/coustom_abb_bar.dart';
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
      backgroundColor: secondary,
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
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: white.withOpacity(0.4),
                ),
                Text(
                  "All",
                  style: TextStyle(
                    color: white.withOpacity(0.4),
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.delete,
                  color: white.withOpacity(0.4),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 170,
              child: ListView.separated(
                  itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.all(miniSpacer),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imageVlues[index],
                                  width: 120,
                                  height: 80,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: miniSpacer,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.hd, color: yellow),
                                Text(
                                  "movie${index + 1}",
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "action",
                                  style: TextStyle(color: yellow),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.circle_outlined,
                              color: white.withOpacity(0.4),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (_, index) => Divider(
                        thickness: 1,
                        color: white.withOpacity(0.4),
                      ),
                  itemCount: imageVlues.length - 15),
            ),
          ],
        ));
  }
}
