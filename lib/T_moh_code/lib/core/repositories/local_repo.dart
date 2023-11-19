import 'package:flutter/material.dart';
import 'package:app/T_moh_code/lib/core/models/product.dart';
import 'package:app/T_moh_code/lib/core/repositories/products_repo.dart';
import 'package:app/T_moh_code/lib/helper/database_manager.dart';

class LocalProductsRepo extends ProductsRepo {
  @override
  Future<List<dynamic>> getProducts() async {
    DBManger dbManger = DBManger();
    return await dbManger.fetch("select * from products");
  }

  @override
  storeProduct(String source, data) {
    Product p = data as Product;
    DBManger dbManger = DBManger();
    // Map<String, dynamic> prodcutRow = p.toJson();
    // List<Map<String, dynamic>> sub_images = [];
    // p.images!.forEach((element) {
    //   Map<String, dynamic> img = Map();
    //   img[DBManger.COL_IMAGE] = element;
    //   sub_images.add(img);
    // });
    // prodcutRow.remove("images");

    Map<String, dynamic> dataAfterSet = setDataToInsert(p);
    return dbManger.insert(source, dataAfterSet["row"],
        foreignTable: DBManger.TBL_IMAGES,
        sub_rows: dataAfterSet["sub_row"],
        fpreignKey: dataAfterSet["foreign_key"]);
  }

  Map<String, dynamic> setDataToInsert(Product p) {
    final data = p.toJson();
    final Map<String, dynamic> dataAfterSet = new Map<String, dynamic>();
    List<Map<String, dynamic>> sub_images = [];
    p.images!.forEach((element) {
      Map<String, dynamic> img = Map();
      img[DBManger.COL_IMAGE] = element;
      sub_images.add(img);
    });
    dataAfterSet["sub_row"] = sub_images ?? null;
    data.remove("images");
    dataAfterSet["row"] = data;

    // dataAfterSet[""]
    dataAfterSet["foreign_key"] = DBManger.COL_PRODUCT_ID;

    return dataAfterSet;
  }
}
