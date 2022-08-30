import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/Product_Vo.dart';

class AddProductViewModel extends GetxController {
  TextEditingController productNameTextController = TextEditingController();
  TextEditingController productCodeTextController = TextEditingController();
  TextEditingController quantityTextController =  TextEditingController(text: "0");
  TextEditingController brandTextController = TextEditingController();
  TextEditingController categoryCodeTextController = TextEditingController();
  TextEditingController itemNameTextController =  TextEditingController(text: "0");


  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  RxList<String> mCategoryList = RxList(["Server", "Mic"]);
  RxList<String> mOfficeList = RxList(["Nano Labs", "LMT", "Mekong", "Tagon"]);

  incrementDecrementQuantity({bool? isIncrement}) {
    int count = int.parse(quantityTextController.text);

    if (isIncrement == true) {
      count++;
    } else {
      if (count > 0) {
        count--;
      }
    }
    quantityTextController.text = count.toString();
  }


  addToFireStore() async{


    Map<String,dynamic> data = {

      "add_by" : "Arjun",
      "created_time" : "Something here",
      "description": "test",
      "alert_count" : 2,
      "brand" : "Huawei",
      "category" : "Router",
      "code" : "007",
      "code_isAlert" : true,
      "item_name" : "P20 Router",
      "office" : "Mekong",
      "qty" : 1,
      "history" : [
        {
          "edit_by" : "@J",
          "qty" : 30,
          "edit_date" : "test",
          "total" : 30
        }
      ]
    };
    print(data);
   try{
      firestoreInstance.collection("productList").add(data).then((value) => Get.snackbar("Success",""))
          .catchError((onError) {

        Get.snackbar("Fail To Add", "value");
      });
    } catch (e) {
      Get.snackbar("Fail To Add", "value");
    }

    Get.snackbar("haha", "hehe");

  }

  uploadToFirebase() async{

    addToFireStore();

  }
}
