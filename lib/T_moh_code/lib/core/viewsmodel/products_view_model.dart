import 'package:app/T_moh_code/lib/core/models/product.dart';
import 'package:app/T_moh_code/lib/core/repositories/products_repo.dart';
import 'package:app/T_moh_code/lib/helper/database_manager.dart';

class ProductViewModel{
  List<Product>_allProducts=[];
  Future<List<Product>>fetchProducts(ProductsRepo productsRepo)async{
    final products=await productsRepo.getProducts();

    print(products);

    try {
      _allProducts = products.map((e) => Product.fromJson(e)).toList();
    }catch(ex) {
      print("the exception is $ex");
    }
      return _allProducts;

  }

// Map<String, dynamic> setDataToInsert(Product p){
//  final data =  p.toJson();
//  final Map<String, dynamic> dataAfterSet = new Map<String, dynamic>();
//  dataAfterSet["row"]=data.remove("images");
//   List<Map<String, dynamic>> sub_images = [];
//     p.images!.forEach((element) {
//       Map<String, dynamic> img = Map();
//       img[DBManger.COL_IMAGE] = element;
//       sub_images.add(img);
//     });
//   dataAfterSet["sub_row"]=sub_images??null;
//   dataAfterSet["foreign_key"]=DBManger.COL_PRODUCT_ID;

//   return dataAfterSet;
// }
  Future<int> addProduct(ProductsRepo productsRepo,Product p)async{
   return await  productsRepo.storeProduct(DBManger.TBL_PRODUCTS,p);
  }
}