import 'package:flutter/material.dart';
import 'package:app/T_moh_code/lib/core/views/screens/favorite_products_screen.dart';
import 'package:app/T_moh_code/lib/core/views/screens/online_roucts_creen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: FavoriteProductsScreen(),);
    return MaterialApp(
      home: OnlineProductsScreen(),
    );
  }
}
