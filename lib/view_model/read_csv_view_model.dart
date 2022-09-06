import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/service/persistence_service.dart';
import '../core/vos/product_vo.dart';

class ReadCsvViewModel extends GetxController {
  RxList mTestCsv = RxList();
  RxList<ProductVo> mCsvList = RxList();
  ///for uploading to server
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isSuccess = false.obs;
  FilePickerResult? fileResult;
  String currentTime =DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()).toString();
  ///read persisntace data
  final persistenceService = Get.find<PersistenceService>();
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
  Map? mUserData;

  void loadCsv() async {
    mCsvList.clear();

    final rawData = await rootBundle.loadString("assets/images/csv.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(rawData);
    mTestCsv.value = _listData;

    for (int i = 1; i < _listData.length; i++) {
      mCsvList.add(ProductVo.fromCsv(_listData[i]));
    }
  }

  readCsvFromFileSystem() async {
    print("file");
    try {
      fileResult = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['csv'],
          allowMultiple: false);

      if (fileResult == null) {
        Get.snackbar("No file selected", "Please Select Csv file");
      } else {
        PlatformFile? file = fileResult?.files.first;
        final input = File(file!.path!).openRead();

        final fields = await input
            .transform(utf8.decoder)
            .transform(const CsvToListConverter())
            .toList();

        csvFileDataToObject(fields);
      }
    } catch (error) {
      Get.snackbar("Something gone wrong", error.toString());
    }
  }

  csvFileDataToObject(List<dynamic> csvData) {
    mCsvList.clear();
    for (int i = 1; i < csvData.length; i++) {
      mCsvList.add(ProductVo.fromCsv(csvData[i]));
    }
  }

  deleteAllCsvData() {
    fileResult = null;
    mCsvList.clear();
    Get.snackbar("Successfully Deleted", "Now, You can add new csv");
  }

  addToFireStore() async {

    int aj = 0;

    isLoading.value = true;
    isError.value = false;
    message.value = "";
    isSuccess.value = false;
    Map<String, dynamic> data = {
      "add_by": mUserData!["user_name"],
      "created_time": currentTime,
      "description": mCsvList[aj].description,
      "alert_count": mCsvList[aj].alertCount,
      "brand": mCsvList[aj].brand,
      "category": mCsvList[aj].category,
      "code": mCsvList[aj].code,
      "item_name": mCsvList[aj].itemName,
      "office": mCsvList[aj].office,
      "qty": mCsvList[aj].qty,
      "history":[]
    };

    try {
      var test =   fireStoreInstance.collection("productList").add(data);
      test.then((value) {
        isLoading.value = false;
        isError.value = false;
        isSuccess.value = true;
        message.value = "Success";
        Get.snackbar("Success", "");

      }).catchError((onError) {
        isLoading.value = false;
        isError.value = true;
        isSuccess.value = false;
        message.value = "$onError";
        Get.snackbar("Fail To Add", "$onError");
      });
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
      isSuccess.value = false;
      message.value = "Something gone wrong with server or internet";
      Get.snackbar("Fail To Add", "Please Try Again");
    }
  }
}
