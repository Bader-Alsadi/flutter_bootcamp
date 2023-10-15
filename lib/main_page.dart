import 'package:app/pages/create_account.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pages/payment_mathod.dart';
import 'package:app/pages/play_vedio.dart';
import 'package:app/pages/sing_in.dart';
import 'package:app/pages/start1.dart';
import 'package:app/pages/start_by_creating_account.dart';
import 'package:app/pages/subscrptiom_plan.dart';
import 'package:app/pages/subscrtion_plan2.dart';
import 'package:app/pages/verification_code.dart';
import 'package:app/pages/whis_list.dart';
import 'package:flutter/material.dart';

class Man_page extends StatefulWidget {
  const Man_page({super.key});

  @override
  State<Man_page> createState() => _Man_pageState();
}

class _Man_pageState extends State<Man_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: WishList(),
      ),
    );
  }
}
