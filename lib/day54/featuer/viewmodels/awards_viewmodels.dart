import 'dart:convert';
import 'dart:math';

import 'package:app/day54/featuer/models/awards_model.dart';
import 'package:app/day54/core/helper/db_manger.dart';
import 'package:flutter/services.dart';

class AwardVeiwModel {
  DBmanager dBmanager = DBmanager();
  Future<List<wards>> fetchDatt(int id) async {
      List<Map<String, dynamic>> fetchDate =
          await dBmanager.getAllDatt(DBmanager.TBL_AWARD, id);
      return fetchDate.map((e) => wards.fromJson(e)).toList();
  }

  Future<int> saveDate(wards wards) async {
    return await dBmanager.insertData(DBmanager.TBL_AWARD, wards.toJson());
  }

}
