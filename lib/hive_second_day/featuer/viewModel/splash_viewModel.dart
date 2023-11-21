import 'package:app/hive_second_day/core/helper/Hive_he;per.dart';
import 'package:app/hive_second_day/core/repositeries/product_repo.dart';
import 'package:app/hive_second_day/featuer/model/product_modle.dart';
import 'package:app/hive_second_day/featuer/viewModel/product_VM.dart';

class SplashVM{

Future<bool>  LoadProduct (ProductREP productREP,String source,{String? boxName})async{
    ProductVM PVM = ProductVM();
    List<Product> products=await PVM.fetchProuctsFromRepo(productREP,source);
    return storgeProudct(products,boxName??source);
  }

bool  storgeProudct(List<Product> product,String boxName){
    HiveHelper HH =HiveHelper(boxName);
    product.forEach((element) {
      HH.Store(element);
    });
    return true;
  }
}