// To parse this JSON data, do
//
//     final productVo = productVoFromJson(jsonString);

import 'dart:convert';

List<ProductVo> productVoFromJson(String str) => List<ProductVo>.from(json.decode(str).map((x) => ProductVo.fromJson(x)));

String productVoToJson(ProductVo data) => json.encode(data.toJson());



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
    this.history,
  });

  String? addBy;
  String? createdTime;
  String? description;
  int? alertCount;
  String? brand;
  String? category;
  String? code;
  String? itemName;
  String? office;
  int? qty;
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
    history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
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
}

class History {
  History({
    this.editBy,
    this.qty,
    this.editDate,
    this.total,
  });

  String? editBy;
  int? qty;
  String? editDate;
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

