import 'package:app/services_provider/featuer/DAOs/area_dao.dart';
import 'package:app/services_provider/featuer/DAOs/category_dao.dart';
import 'package:app/services_provider/featuer/DAOs/inquiry_dao.dart';
import 'package:app/services_provider/featuer/DAOs/order_dao.dart';
import 'package:app/services_provider/featuer/DAOs/rating_dao.dart';
import 'package:app/services_provider/featuer/DAOs/service_dao.dart';
import 'package:app/services_provider/featuer/DAOs/service_provider_dao.dart';
import 'package:app/services_provider/featuer/DAOs/user_dao.dart';
import 'package:app/services_provider/featuer/entities/area_entity.dart';
import 'package:app/services_provider/featuer/entities/category_entity.dart';
import 'package:app/services_provider/featuer/entities/inquiry_entity.dart';
import 'package:app/services_provider/featuer/entities/location_entity.dart';
import 'package:app/services_provider/featuer/entities/order_emtity.dart';
import 'package:app/services_provider/featuer/entities/rating_entity.dart';
import 'package:app/services_provider/featuer/entities/service_entity.dart';
import 'package:app/services_provider/featuer/entities/service_provider_entity.dart';
import 'package:app/services_provider/featuer/entities/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  Area,
  Category,
  Inquiry,
  Location,
  Order,
  Rating,
  Service,
  ServiceProvider,
  User
])
abstract class AppDatabase extends FloorDatabase {
  AreaDao get areaDao;
  CategoryDao get categoryDao;
  InquiryDao get inquiryDao;
  OrderDao get orderDao;
  RatingDao get ratingDao;
  ServiceDao get serviceDao;
  ServiceProviderDao get serviceProviderDao;
  UserDao get userDao;
}
