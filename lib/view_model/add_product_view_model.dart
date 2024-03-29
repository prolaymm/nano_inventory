import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nano_inventory/core/vos/drop_down_vo.dart';

import '../core/service/persistence_service.dart';
import '../core/vos/product_vo.dart';

class AddProductViewModel extends GetxController {
  TextEditingController brandNameTextController = TextEditingController();
  TextEditingController itemNameTextController = TextEditingController();
  TextEditingController itemCodeTextController = TextEditingController();
  TextEditingController quantityTextController =
      TextEditingController(text: "0");
  TextEditingController categoryTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController companyTextController = TextEditingController();
  TextEditingController alertQuantityTextController =
      TextEditingController(text: "0");

  ///current time

  String currentTime =
      DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()).toString();

  ///category drop down
  Rx<DropDownVo>? dropDownCategoryValue;
  RxBool isDropDownCategoryNull = false.obs;
  Rx nullCategoryDropDown = null.obs;

  ///user data from persistance
  final persistenceService = Get.find<PersistenceService>();
  Map? mUserData;

  ///form key
  GlobalKey<FormState> formKey = GlobalKey();

  ///this is for error and loading
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isSuccess = false.obs;
  ProductVo updateVo = ProductVo();

  List<DropDownVo> testVo = [
    DropDownVo(
      id: "1",
      title: 'NanoLabs',
    ),
    DropDownVo(
      id: "2",
      title: 'LMT',
    ),
    DropDownVo(
      id: "3",
      title: 'MEKONG',
    ),
    DropDownVo(
      id: "4",
      title: 'Smart Tech',
    ),
  ];

  DropDownVo? officeDropDown;

  ///drop down for company list
  RxList<DropDownVo> companyList = RxList([
    DropDownVo(
      id: "1",
      title: 'NanoLabs',
    ),
    DropDownVo(
      id: "2",
      title: 'LMT',
    ),
    DropDownVo(
      id: "3",
      title: 'MEKONG',
    ),
    DropDownVo(
      id: "4",
      title: 'Smart Tech',
    ),
  ]);
  Rx<DropDownVo>? dropDownCompanyValue;
  RxBool isDropDownCompanyNull = false.obs;
  Rx nullCompanyDropDown = null.obs;

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

  addToFireStore({required isUpdate}) async {
    if (isUpdate) {
      updateVo.history?.add(History(
          editBy: mUserData!["user_name"],
          qty: 20,
          editDate: currentTime,
          total: 50));
    }

    isLoading.value = true;
    isError.value = false;
    message.value = "";
    isSuccess.value = false;
    Map<String, dynamic> data = {
      "add_by": mUserData!["user_name"],
      "created_time": currentTime,
      "description": descriptionTextController.text,
      "alert_count": int.parse(alertQuantityTextController.text),
      "brand": brandNameTextController.text,
      "category": categoryTextController.text,
      "code": itemCodeTextController.text,
      "item_name": itemNameTextController.text,
      "office": officeDropDown?.title,
      "qty": int.parse(quantityTextController.text),
      "history": updateVo.history == [] || updateVo.history == null
          ? []
          : updateVo.history
              ?.map((history) => {
                    "edit_by": mUserData!["user_name"],
                    "qty": history.qty,
                    "edit_date": history.editDate,
                    "total": history.total,
                  })
              .toList()
    };

    try {
      var test = isUpdate
          ? fireStoreInstance
              .collection("productList")
              .doc(updateVo.id)
              .update(data)
          : fireStoreInstance.collection("productList").add(data);
      test.then((value) {
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
    brandNameTextController.text = "";
    itemNameTextController.text = "";
    itemCodeTextController.text = "";
    quantityTextController.text = "0";
    categoryTextController.text = "";
    descriptionTextController.text = "";
    alertQuantityTextController.text = "0";
    officeDropDown = null;
  }

  onFailTryAgain() {
    isLoading.value = false;
    isError.value = false;
    message.value = "";
  }

  updateProductInfo() {}

  textControllerValueForEdit(ProductVo vo) {
    brandNameTextController.text = vo.brand ?? "//";
    itemNameTextController.text = vo.itemName ?? "--";
    itemCodeTextController.text = vo.code ?? "_";
    quantityTextController.text = vo.qty.toString();
    categoryTextController.text = vo.category ?? "_";
    companyTextController.text = vo.office ?? "_";
    descriptionTextController.text = vo.description ?? "_";
    alertQuantityTextController.text = vo.alertCount.toString();
  }

  onDropDownChange(DropDownVo? value) {
    dropDownCompanyValue?.value = value!;
    isDropDownCompanyNull.value = false;
    officeDropDown = value;
    print("this is $officeDropDown");
    update();
  }
}
