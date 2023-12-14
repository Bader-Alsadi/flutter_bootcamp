import 'package:app/blog_app/featuer/views/add_artical/add_artical.dart';
import 'package:app/blog_app/featuer/views/display_page/dispaly_page.dart';
import 'package:app/blog_app/featuer/views/errors/errer_page.dart';
import 'package:app/blog_app/featuer/views/login_page/login.dart';
import 'package:app/blog_app/featuer/views/no_connection/no_concttion.dart';
import 'package:app/blog_app/featuer/views/singin_page/singim_page.dart';
import 'package:app/blog_app/featuer/views/spalch_screen.dart/splach_screen.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static Route<dynamic>? generRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplachScreen.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return SplachScreen();
          });
        }
      case Login.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Login();
          });
        }
      case Singin.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Singin();
          });
        }

      case HomePage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return HomePage();
          });
        }
      case AddArtical.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return AddArtical();
          });
        }
      case NoconnectionPage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return NoconnectionPage();
          });
        }

      default:
        return MaterialPageRoute(builder: (cmc) {
          return Error404();
        });
    }
  }
}
