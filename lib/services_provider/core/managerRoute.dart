import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:app/services_provider/featuer/view/login_page/login_page.dart';
import 'package:app/services_provider/featuer/view/notfiction_page/notfiction_page.dart';
import 'package:app/services_provider/featuer/view/order_page/AddOrder.dart';
import 'package:app/services_provider/featuer/view/order_page/orders_page.dart';
import 'package:app/services_provider/featuer/view/presonal_Infomation/presonal_formation.dart';
import 'package:app/services_provider/featuer/view/profile_page/profile_page.dart';
import 'package:app/services_provider/featuer/view/settings_view/settings_view.dart';
import 'package:app/services_provider/featuer/view/sing_in_page/sing_in_page.dart';
import 'package:app/services_provider/featuer/view/validation_page/validtion_page.dart';
import 'package:app/services_provider/featuer/view/welcom_page/welcome_page.dart';
import 'package:flutter/material.dart';

import '../featuer/view/add_service_provider/add_service_provider.dart';

class RouteManger {
  static Route<dynamic>? generRoute(RouteSettings settings) {
    switch (settings.name) {
      case AddServiceProvider.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return AddServiceProvider();
          });
        }
      case Dashboard.ROUTE:
        {
          int id = settings.arguments as int;
          return MaterialPageRoute(builder: (cmc) {
            return Dashboard();
          });
        }
      case login_page.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return login_page();
          });
        }
      case AddOrder.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return AddOrder();
          });
        }
      case OrderSPage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return OrderSPage();
          });
        }

      case PresonalInfomation.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return PresonalInfomation();
          });
        }
      case ProfilePage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return ProfilePage();
          });
        }
      case SettingsView.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return SettingsView();
          });
        }

      case Sing_in_page.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Sing_in_page();
          });
        }
      case ValidationPage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return ValidationPage();
          });
        }
      case WelcomePage.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return WelcomePage();
          });
        }
      case Notfiction_page.ROUTE:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Notfiction_page();
          });
        }
      // default:
      //   return MaterialPageRoute(builder: (cmc) {
      //     return NotFound();
      //   });
    }
    return null;
  }
}
