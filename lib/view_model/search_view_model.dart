import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/persistance/product_db.dart';
import '../core/vos/product_vo.dart';

class SearchViewModel extends GetxController {
  final ProductDb _db = ProductDb();
  TextEditingController searchTextController = TextEditingController();
  RxList<ProductVo> mProductList = RxList();
  RxList<ProductVo> mSearchList = RxList();
  RxBool isSearch = false.obs;

  getProductList() {
    isSearch.value = false;
    searchTextController.text = "";
    print("getting");
    mProductList.clear();
    mProductList.value = _db.getAllProduct();
    mProductList.refresh();
  }

  onTextFormFieldChange(String? test) {}

  onFieldSubmitted(String? test) {
    searchFromList();
  }

  searchFromList() {
    isSearch.value = true;
    mProductList.value = mProductList.where((product) {
      return product.itemName!
              .toLowerCase()
              .contains(searchTextController.text.toLowerCase()) ||
          product.brand!
              .toLowerCase()
              .contains(searchTextController.text.toLowerCase()) ||
          product.code!
              .toLowerCase()
              .contains(searchTextController.text.toLowerCase()) ||
          product.qty
              .toString()
              .toLowerCase()
              .contains(searchTextController.text.toLowerCase());
    }).toList();
  }
}
