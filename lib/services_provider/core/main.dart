import 'package:app/services_provider/core/helper/db_helper.dart';
import 'package:app/services_provider/core/managerRoute.dart';
import 'package:app/services_provider/core/them/app_them.dart';
import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:app/services_provider/featuer/view/notfiction_page/notfiction_page.dart';
import 'package:app/services_provider/featuer/view/order_page/AddOrder.dart';
import 'package:app/services_provider/featuer/view/order_page/orders_page.dart';
import 'package:app/services_provider/featuer/view/presonal_Infomation/presonal_formation.dart';
import 'package:app/services_provider/featuer/view/profile_page/profile_page.dart';
import 'package:app/services_provider/featuer/view/settings_view/settings_view.dart';
import 'package:app/services_provider/featuer/view/validation_page/validtion_page.dart';
import 'package:app/services_provider/featuer/view/welcom_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBhelper.initDatabase();
  await GetStorage.init("user");
  await GetStorage.init("them");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManger.generRoute,
      theme: ligth,
      title: 'Material App',
      home: WelcomePage(),
    );
  }
}
