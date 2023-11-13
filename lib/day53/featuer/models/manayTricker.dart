import 'package:flutter/material.dart';

class ManayTriker {
  int? id;
  late double amount;
  late bool opretore;

  ManayTriker({required this.amount, required this.opretore, this.id = null});
  ManayTriker.fromJOSN(Map<String, dynamic> josn) {
    print(josn);
    id = josn["id"] ?? null;
    amount = double.parse(josn["amount"]);
    opretore = josn["opretore"] == 1 ? true : false;
  }
  Map<String, dynamic> tojosn() {
    return {
      "id": id ?? null,
      "amount": "$amount",
      "opretore": opretore ? 1 : 0
    };
  }
}
