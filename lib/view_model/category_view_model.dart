import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryViewModel extends GetxController {

  TextEditingController categoryTextController = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey();

  ///this is for error and loading
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isSuccess = false.obs;
  RxList<Map<String,dynamic>> mCategoryList = RxList();


  /// company list





  ///firestore instance
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;


  addCategoryToFireStore() async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    isSuccess.value = false;


    try {
      var dataAdd = fireStoreInstance.collection("category").add({"type": categoryTextController.text});
      dataAdd.then((value) {
        isLoading.value = false;
        isError.value = false;


        isSuccess.value = true;
        message.value = "Success";
        Get.snackbar("Success", "");
        clearTextControllerValue();
      }).catchError((onError) {
        isLoading.value = false;
        isError.value = true;
        isSuccess.value = false;
        message.value = "$onError";
        Get.snackbar("Fail To Add", "value");
      });
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
      isSuccess.value = false;
      message.value = "Something gone wrong with server or internet";
      Get.snackbar("Fail To Add", "Please Try Again");
    }
  }

  //clear all textform field data
  clearTextControllerValue() {
    categoryTextController.text = "";
  }

  onFailTryAgain() {
    isLoading.value = false;
    isError.value = false;
    message.value = "";
  }


  updateProductInfo() {}


}