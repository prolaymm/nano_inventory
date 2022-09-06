// To parse this JSON data, do
//
//     final productVo = productVoFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:nano_inventory/utils/db_constant.dart';

part 'product_vo.g.dart';

List<ProductVo> productVoFromJson(String str) =>
    List<ProductVo>.from(json.decode(str).map((x) => ProductVo.fromJson(x)));

String productVoToJson(ProductVo data) => json.encode(data.toJson());

List<ProductVo> productVoFromCsv(List<dynamic> csvList) =>
    List<ProductVo>.from(csvList.map((x) => ProductVo.fromCsv(x)));

@HiveType(typeId: hiveProductId)
class ProductVo {
  ProductVo({
    this.addBy,
    this.createdTime,
    this.description,
    this.alertCount,
    this.brand,
    this.category,
    this.code,
    this.itemName,
    this.office,
    this.qty,
    this.id,
    this.history,
  });

  @HiveField(0)
  String? addBy;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? createdTime;
  @HiveField(3)
  String? description;
  @HiveField(4)
  int? alertCount;
  @HiveField(5)
  String? brand;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? code;
  @HiveField(8)
  String? itemName;
  @HiveField(9)
  String? office;
  @HiveField(10)
  int? qty;
  @HiveField(11)
  List<History>? history;

  factory ProductVo.fromJson(Map<String, dynamic> json) => ProductVo(
        addBy: json["add_by"],
        createdTime: json["created_time"],
        description: json["description"],
        alertCount: json["alert_count"],
        brand: json["brand"],
        category: json["category"],
        code: json["code"],
        itemName: json["item_name"],
        office: json["office"],
        qty: json["qty"],
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
      );

  factory ProductVo.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ProductVo(
        id: doc.id,
        addBy: doc.data()!["add_by"],
        createdTime: doc.data()!["created_time"],
        description: doc.data()!["description"],
        alertCount: doc.data()!["alert_count"],
        brand: doc.data()!["brand"],
        category: doc.data()!["category"],
        code: doc.data()!["code"],
        itemName: doc.data()!["item_name"],
        office: doc.data()!["office"],
        qty: doc.data()!["qty"],
        history: List<History>.from(
            doc.data()!["history"].map((x) => History.fromJson(x))),
      );

  factory ProductVo.fromCsv(dynamic) => ProductVo(
        addBy: dynamic[0],
        createdTime: dynamic[1],
        description: dynamic[2],
        alertCount: 3,
        brand: dynamic[4],
        category: dynamic[5],
        code: dynamic[6],
        itemName: dynamic[7],
        office: dynamic[8],
        qty: 10,
        history: [],
      );

  Map<String, dynamic> toJson() => {
        "add_by": addBy,
        "created_time": createdTime,
        "description": description,
        "alert_count": alertCount,
        "brand": brand,
        "category": category,
        "code": code,
        "item_name": itemName,
        "office": office,
        "qty": qty,
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

@HiveType(typeId: hiveHistoryId)
class History {
  History({
    this.editBy,
    this.qty,
    this.editDate,
    this.total,
  });

  @HiveField(0)
  String? editBy;

  @HiveField(1)
  int? qty;

  @HiveField(2)
  String? editDate;

  @HiveField(3)
  int? total;

  factory History.fromJson(Map<String, dynamic> json) => History(
        editBy: json["edit_by"],
        qty: json["qty"],
        editDate: json["edit_date"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "edit_by": editBy,
        "qty": qty,
        "edit_date": editDate,
        "total": total,
      };
}
