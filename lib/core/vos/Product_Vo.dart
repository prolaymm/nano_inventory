// To parse this JSON data, do
//
//     final productVo = productVoFromJson(jsonString);

import 'dart:convert';

import 'edit_history.dart';

ProductVo productVoFromJson(String str) => ProductVo.fromJson(json.decode(str));

String productVoToJson(ProductVo data) => json.encode(data.toJson());

class ProductVo {
  ProductVo({
    this.productList,
  });

  List<ProductList>? productList;

  factory ProductVo.fromJson(Map<String, dynamic> json) => ProductVo(
    productList: List<ProductList>.from(json["product_list"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_list": List<dynamic>.from(productList!.map((x) => x.toJson())),
  };
}

class ProductList {
  ProductList({
    this.addBy,
    this.productType,
    this.addedDate,
    this.alertQty,
    this.isAlert,
    this.qty,
    this.id,
    this.code,
    this.office,
    this.brand,
    this.itemName,
    this.category,
    this.editHistory,
  });

  String? addBy;
  String? productType;
  String? addedDate;
  int? alertQty;
  bool? isAlert;
  int? qty;
  String? id;
  String? code;
  String? office;
  String? brand;
  String? itemName;
  String? category;
  EditHistory? editHistory;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    addBy: json["add_by"],
    productType: json["product_type"],
    addedDate: json["added_date"],
    alertQty: json["alert_qty"],
    isAlert: json["is_alert"],
    qty: json["qty"],
    id: json["id"],
    code: json["code"],
    office: json["office"],
    brand: json["brand"],
    itemName: json["item_name"],
    category: json["category"],
    editHistory: EditHistory.fromJson(json["edit_history"]),
  );

  Map<String, dynamic> toJson() => {
    "add_by": addBy,
    "product_type": productType,
    "added_date": addedDate,
    "alert_qty": alertQty,
    "is_alert": isAlert,
    "qty": qty,
    "id": id,
    "code": code,
    "office": office,
    "brand": brand,
    "item_name": itemName,
    "category": category,
    "edit_history": editHistory?.toJson(),
  };
}

