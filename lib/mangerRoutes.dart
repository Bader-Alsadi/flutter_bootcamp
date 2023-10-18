import 'package:app/pages/create_account.dart';
import 'package:app/pages/eidt_profile.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pages/play_vedio.dart';
import 'package:app/pages/sing_in.dart';
import 'package:app/pages/start1.dart';
import 'package:app/pages/start_by_creating_account.dart';
import 'package:app/pages/subscrptiom_plan.dart';
import 'package:app/pages/subscrtion_plan2.dart';
import 'package:app/pages/verification_code.dart';
import 'package:app/routeNames.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static Route<dynamic>? generRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Start1();
          });
        }
      case homeScreen:
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          });
        }
      case singin:
        {
          return MaterialPageRoute(builder: (ctx) {
            return SingInPage();
          });
        }
      case startCreatAncouuntPage:
        {
          return MaterialPageRoute(builder: (ctx) {
            return StartByCreateAccount();
          });
        }
      case createAccount:
        {
          return MaterialPageRoute(builder: (ctx) {
            return CreateAccounte();
          });
        }
      case subscrption:
        {
          return MaterialPageRoute(builder: (ctx) {
            return SubscrptionPlanpage();
          });
        }
      case subscrption2:
        {
          return MaterialPageRoute(builder: (ctx) {
            return SubscrptionPlanpage2();
          });
        }
      case verifictionPage:
        {
          return MaterialPageRoute(builder: (ctx) {
            return verificaton_code_page();
          });
        }

      case editProfile:
        {
          return MaterialPageRoute(builder: (ctx) {
            return EditProfile();
          });
        }
         case playVideo:
        {
          return MaterialPageRoute(builder: (ctx) {
            return PlayVideoer();
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
