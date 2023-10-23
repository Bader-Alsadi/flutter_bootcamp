import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/featuers/pages/create_account_pages/create_account.dart';
import 'package:app/movie_app/featuers/pages/create_account_pages/start_by_creating_account.dart';
import 'package:app/movie_app/featuers/pages/create_account_pages/verification_code.dart';
import 'package:app/movie_app/featuers/pages/edit_profile/eidt_profile.dart';
import 'package:app/movie_app/featuers/pages/home_pages/home_screen.dart';
import 'package:app/movie_app/featuers/pages/play_video_pages/play_vedio.dart';
import 'package:app/movie_app/featuers/pages/singIn_page/sing_in.dart';
import 'package:app/movie_app/featuers/pages/startup_pages/start1.dart';
import 'package:app/movie_app/featuers/pages/subscrption_pages/subscrptiom_plan.dart';
import 'package:app/movie_app/featuers/pages/subscrption_pages/subscrtion_plan2.dart';

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
