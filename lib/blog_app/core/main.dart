import 'package:app/blog_app/core/manager_route.dart';
import 'package:app/blog_app/featuer/viewmodels/artical_vm.dart';
import 'package:app/blog_app/featuer/views/display_page/dispaly_page.dart';
import 'package:app/blog_app/featuer/views/errors/errer_page.dart';
import 'package:app/blog_app/featuer/views/login_page/login.dart';
import 'package:app/blog_app/featuer/views/singin_page/singim_page.dart';
import 'package:app/blog_app/featuer/views/spalch_screen.dart/splach_screen.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init("user");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticalVM>(
        create: (context) => ArticalVM(),
        child: MaterialApp(
          title: 'Material App',
          initialRoute: SplachScreen.ROUTE,
          onGenerateRoute: RouteManger.generRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
