import 'package:app/talka%20app/core/routeNames.dart';
import 'package:app/talka%20app/featuer/pages/talka_plus/talka_plus_page.dart';
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

      // default:
      //   return MaterialPageRoute(builder: (cmc) {
      //     return NotFound();
      //   });
    }
    return null;
  }
}
