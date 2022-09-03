import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/persistance/product_db.dart';

import '../core/vos/product_vo.dart';


class ProductViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  TextEditingController searchTextController = TextEditingController();
  RxBool isTextFormFieldEmpty = true.obs;
  RxBool isSearch = false.obs;
  RxList<Map> allData = RxList();
  final ProductDb _db = ProductDb();



  RxList<ProductVo> mProductList = RxList();

  ///firebase collection
  final collectionRef = FirebaseFirestore.instance.collection("productList");

  /// get data from firebase
  Future getData() async {}

  fetchDataFromFirebase() async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    _db.deleteAllProduct();
    try {
      await collectionRef.get().then((querySnapshot) {
        isLoading.value = false;
        isError.value = false;
        message.value = "Success";
     //   Get.snackbar("Success", "Success");
       // allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();
        mProductList.value = querySnapshot.docs.map((doc) => ProductVo.fromDocumentSnapshot(doc)).toList();
        _db.saveProductList(productList: mProductList);
      }).onError((error, stackTrace) {
        isLoading.value = false;
        isError.value = true;
        message.value = "Fail";
        message.value = jsonEncode(allData).toString();

        Get.snackbar("$error", "erro no firenbase");
      });
    } catch (error) {
      isLoading.value = false;
      isError.value = true;
      message.value = "Fail";
      Get.snackbar("Errro on cache", "$error");
    }
  }


  getCurrentUserId() {


  }
  onTextFormFieldChange(String? test) {}

  onFieldSubmitted(String? test) {}


}
