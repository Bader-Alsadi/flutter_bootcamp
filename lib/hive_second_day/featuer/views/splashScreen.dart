import 'package:app/hive_second_day/core/constane/API_url.dart';
import 'package:app/hive_second_day/core/repositeries/product_onlien_repo.dart';
import 'package:app/hive_second_day/featuer/viewModel/splash_viewModel.dart';
import 'package:app/hive_second_day/featuer/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    loadData();
    return Center(child: CircularProgressIndicator(),) ;
  }

  loadData()async{
    SplashVM SVM = SplashVM();
    await SVM.LoadProduct(ProductOnlineRepo(), API_url.PRODUCT_URL,boxName: "products");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomeScreenH();
    }));

  }
}