import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/Product_Vo.dart';

class AddProductViewModel extends GetxController {


  TextEditingController brandNameTextController = TextEditingController();
  TextEditingController itemNameTextController = TextEditingController();
  TextEditingController itemCodeTextController = TextEditingController();
  TextEditingController quantityTextController =
      TextEditingController(text: "0");
  TextEditingController brandTextController = TextEditingController();
  TextEditingController categoryTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController alertQuantityTextController =
      TextEditingController(text: "0");

  GlobalKey<FormState> formKey = GlobalKey();

  ///this is for error and loading
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isSuccess = false.obs;

  ///firestore instance
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  RxList<String> mCategoryList = RxList(["Server", "Mic"]);
  RxList<String> mOfficeList = RxList(["Nano Labs", "LMT", "Mekong", "Tagon"]);

  incrementDecrementQuantity(
      {bool? isIncrement, required TextEditingController controller}) {
    int count = int.parse(controller.text);

    if (isIncrement == true) {
      count++;
    } else {
      if (count > 0) {
        count--;
      }
    }
    controller.text = count.toString();
  }

  addToFireStore() async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    isSuccess.value = false;
    Map<String, dynamic> data = {
      "add_by": "Arjun",
      "created_time": "DateTime.now().toString()",
      "description": descriptionTextController.text,
      "alert_count": int.parse(alertQuantityTextController.text),
      "brand": brandNameTextController.text,
      "category": categoryTextController.text,
      "code": itemCodeTextController.text,
      "item_name": itemNameTextController.text,
      "office": "Mekong",
      "qty": 20,
      "history": [
        {"edit_by": "@J", "qty": 30, "edit_date": "DateTime.now()", "total": 30}
      ]
    };

    try {
      fireStoreInstance.collection("productList").add(data).then((value) {
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

  uploadToFirebase() async {
    addToFireStore();
  }




  //clear all textform field data
  clearTextControllerValue() {
    brandNameTextController.text = "";
    itemNameTextController.text = "";
    itemCodeTextController.text = "";
    quantityTextController.text = "";
    brandTextController.text = "";
    categoryTextController.text = "";
    descriptionTextController.text = "";
    alertQuantityTextController.text = "";
  /*  brandNameTextController.dispose();
    itemNameTextController.dispose();
    itemCodeTextController.dispose();
    quantityTextController.dispose();
    brandTextController.dispose();
    categoryTextController.dispose();
    descriptionTextController.dispose();
    alertQuantityTextController.dispose();*/

  }

  onFailTryAgain() {
    isLoading.value = false;
    isError.value = false;
    message.value = "";
  }

}
