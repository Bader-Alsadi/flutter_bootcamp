import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBmanager{

  Database ?_db;
  String db_Name= "store.db";
 int version = 1;
// columes for products table
static const String Tbl_PRODUCTS = "products";
static const String COL_ID = "id";
static const String COL_TITLE = "title";
static const String COL_DESCRPTION = "description";
static const String COL_PRICE = "price";
static const String COL_DISCOUNT_PER = "discountPercentage";
static const String COL_RATING = "rating";
static const String COL_STOCK = "stock";
static const String COL_BRAND = "brand";
static const String COL_CATEGORY = "category";
static const String COL_THUMBNAIL = "thumbnail";

//colums for image table

static const String Tbl_IMAGES = "products_images";
static const String COL_IMAGE = "image";
static const String COL_PRODUCT_ID = "pruduct_id";

//data type for creat
static const String ID_TYPE = "INTEGER primary key autoincrement";
static const String INTEGER_type = "INTEGER";
static const String DOUBLE_TYPE = "double";
static const String VARCHAR_TYPE = "varchar(255)";


  Future<Database> get object async{
    _db??await initDatabse();

    return _db!;
  }

  initDatabse()async{
    String folder = await getDatabasesPath();
    String path = join(folder,db_Name);
    openDatabase(path,version: version,onCreate: (db,version){
      db.execute("""
create table $Tbl_PRODUCTS (
  $COL_TITLE $ID_TYPE,
  $COL_DESCRPTION $ID_TYPE,
  $COL_PRICE $ID_TYPE,
  $COL_DISCOUNT_PER $ID_TYPE,
  $COL_RATING $ID_TYPE,
  $COL_STOCK $ID_TYPE,
  $COL_BRAND $ID_TYPE,
  $COL_CATEGORY $ID_TYPE,
  $COL_THUMBNAIL $ID_TYPE
);
""");
    });


  }
}