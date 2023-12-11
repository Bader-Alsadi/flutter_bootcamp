import 'dart:typed_data';

import 'package:app/services_provider/core/local_database/DAOs/area_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/category_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/inquiry_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/location_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/order_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/rating_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/service_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/service_provider_dao.dart';
import 'package:app/services_provider/core/local_database/DAOs/user_dao.dart';
import 'package:app/services_provider/core/local_database/entities/area_entity.dart';
import 'package:app/services_provider/core/local_database/entities/category_entity.dart';
import 'package:app/services_provider/core/local_database/entities/inquiry_entity.dart';
import 'package:app/services_provider/core/local_database/entities/location_entity.dart';
import 'package:app/services_provider/core/local_database/entities/order_emtity.dart';
import 'package:app/services_provider/core/local_database/entities/rating_entity.dart';
import 'package:app/services_provider/core/local_database/entities/service_entity.dart';
import 'package:app/services_provider/core/local_database/entities/service_provider_entity.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  Area,
  Category,
  Inquiry,
  Location,
  // Order,

  Rating,
  Service,
  ServiceProvider,
  User
])
abstract class AppDatabase extends FloorDatabase {
  AreaDao get areaDao;
  CategoryDao get categoryDao;
  InquiryDao get inquiryDao;
  LocationDao get locationDao;
  // OrderDao get orderDao;
  RatingDao get ratingDao;
  ServiceDao get serviceDao;
  ServiceProviderDao get serviceProviderDao;
  UserDao get userDao;
}
