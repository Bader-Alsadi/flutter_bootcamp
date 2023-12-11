import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplachSreen extends StatelessWidget {
  const SplachSreen({super.key});

  @override
  Widget build(BuildContext context) {
    // delay5Secs(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 150,
        ),
      ),
    );
  }

  // delay5Secs(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 5));
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Dashboard()));
  // }
}
