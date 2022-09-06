import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/vos/product_vo.dart';

class ReadCsvViewModel extends GetxController {
  RxList mTestCsv = RxList();
  RxList<ProductVo> mCsvList = RxList();

  FilePickerResult? fileResult;

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
}
