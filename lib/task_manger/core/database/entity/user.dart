import 'package:floor/floor.dart';

@Entity()
class User {
  @primaryKey
  int? id;
  String? name;
  @ignore
  bool isSelecte=false;
  User({this.id,
    this.name,
  });
}
