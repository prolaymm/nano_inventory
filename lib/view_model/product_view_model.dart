import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/Product_Vo.dart';

class ProductViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  TextEditingController searchTextController = TextEditingController();
  RxBool isTextFormFieldEmpty = true.obs;
  RxBool isSearch = false.obs;
  RxList<Map> allData = RxList();

  RxList<ProductVo> mProductList = RxList();

  ///firebase collection
  final collectionRef = FirebaseFirestore.instance.collection("productList");

  /// get data from firebase
  Future getData() async {}

  fetchDataFromFirebase() async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    try {
      await collectionRef.get().then((querySnapshot) {
        isLoading.value = false;
        isError.value = false;
        message.value = "Success";
        Get.snackbar("Success", "Success");
        allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();

        mProductList.value = productVoFromJson(jsonEncode(allData));
        //print(mProductList);
        //  message.value = jsonEncode(allData.value).toString();
      }).onError((error, stackTrace) {
        isLoading.value = false;
        isError.value = true;
        message.value = "Fail";
        message.value = jsonEncode(allData.value).toString();

        Get.snackbar("$error", "erro no firenbase");
      });
    } catch (error) {
      isLoading.value = false;
      isError.value = true;
      message.value = "Fail";
      Get.snackbar("Errro on cache", "$error");
    }
  }

  onTextFormFieldChange(String? test) {}

  onFieldSubmitted(String? test) {}


}
