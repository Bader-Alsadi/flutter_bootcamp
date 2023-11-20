
import 'package:hive/hive.dart';
part 'product.g.dart';
@HiveType(typeId: 1)
class Product extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  int gty;

Product({required this.name,required this.price,required this.gty});

}