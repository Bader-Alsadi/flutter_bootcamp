import 'package:hive/hive.dart';
part 'product_modle.g.dart';
@HiveType(typeId: 1)
class Product extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  int? price;
  @HiveField(4)
  int? stock;
  @HiveField(5)
  String? brand;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];

    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;

    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;

    return data;
  }
}
