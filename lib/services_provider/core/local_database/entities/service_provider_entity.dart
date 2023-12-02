import 'dart:typed_data';

import 'package:app/services_provider/core/local_database/entities/category_entity.dart';
import 'package:floor/floor.dart';
@Entity(foreignKeys: [ForeignKey(childColumns: ["Category_id"], parentColumns: ["id"], entity: Category)])
class ServiceProvider{
  @primaryKey
  int? id;
  int Category_id ;
  String? detilas;
  String? create_at;
  @ignore
  String? category_name;
  @ignore
  String? name;
  @ignore
  String? locatoin;
  @ignore
  String? cell_phone;
  @ignore
  Uint8List? user_image;


  ServiceProvider({this.id,required this.Category_id, this.detilas}){
    this.create_at=DateTime.now().toString();
  }

}