import 'package:app/talka%20app/core/routeNames.dart';
import 'package:app/talka%20app/featuer/pages/dwai/dwai_page.dart';
import 'package:app/talka%20app/featuer/pages/my_info/my_info_page.dart';
import 'package:app/talka%20app/featuer/pages/myadresse/my_address_page.dart';
import 'package:app/talka%20app/featuer/pages/partners_in_good/partners_in_good.dart';
import 'package:app/talka%20app/featuer/pages/settings_page/settings_page.dart';
import 'package:app/talka%20app/featuer/pages/talka_plus/talka_plus_page.dart';
import 'package:app/talka%20app/featuer/pages/wslni/wslni_page.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static Route<dynamic>? generRoute(RouteSettings settings) {
    switch (settings.name) {
      case talkaPlusPage:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: TalkaPlusPage());
          });
        }
      case dwaiPage:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: DwaiPage());
          });
        }
      case wsalinPage:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: WsalinPage());
          });
        }
      case partenersInGood:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: PartenersInGood());
          });
        }

      case myInfo:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: MyInfoPage());
          });
        }
      case myAddress:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: MyAddressPage());
          });
        }
      case mySettings:
        {
          return MaterialPageRoute(builder: (cmc) {
            return Directionality(
                textDirection: TextDirection.rtl, child: Mysettings());
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
