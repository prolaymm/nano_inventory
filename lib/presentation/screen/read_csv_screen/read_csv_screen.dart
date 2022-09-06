import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/product_container.dart';
import 'package:nano_inventory/view_model/read_csv_view_model.dart';

import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';

class ReadCsvScreen extends StatelessWidget {
  const ReadCsvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readCsvVm = Get.find<ReadCsvViewModel>();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Read From Csv',
        isBack: true,
      ),
      body: Obx(
        () => readCsvVm.mCsvList.isEmpty
            ? InfoWidget(
          title: "Data Not Found!!!\n There is not data found",
          image: "assets/images/empty.png",
          isButton: true,
          buttonColor: Theme.of(context).errorColor,
          onClick: readCsvVm.readCsvFromFileSystem,
          buttonText: "Read Csv",
        )
            : ListView.builder(
                itemCount: readCsvVm.mCsvList.length,
                itemBuilder: (_, index) {
                  return ProductContainer(vo: readCsvVm.mCsvList[index]);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:  readCsvVm.readCsvFromFileSystem,
          child: const Icon(Icons.add)),
    );
  }
}
