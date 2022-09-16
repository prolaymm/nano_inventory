import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/product_container.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/read_csv_view_model.dart';

import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';

class ReadCsvScreen extends StatelessWidget {
  const ReadCsvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readCsvVm = Get.find<ReadCsvViewModel>();
    readCsvVm.mUserData = readCsvVm.persistenceService.secureData;
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Read From Csv',
        isBack: true,
      ),
      body: Obx(
        () => readCsvVm.mCsvList.isEmpty
            ? InfoWidget(
                title: "No Product\n Please Read Csv From File System",
                isLottie: true,
                lottieSize: 360,
                lottieFile: "assets/icons/lottie_empty.json",
                isButton: true,
                onClick: readCsvVm.readCsvFromFileSystem,
                buttonWidth: 180,
                buttonColor: Theme.of(context).errorColor,
                buttonText: "Read From Csv",
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: readCsvVm.mCsvList.length,
                      itemBuilder: (_, index) {
                        return ProductContainer(
                          vo: readCsvVm.mCsvList[index],
                          isReadFromCsv: true,
                        );
                      },
                    ),
                  ),
                  Obx(
                    () => readCsvVm.mCsvList.isNotEmpty
                        ? Container(
                            width: 200,
                            margin: const EdgeInsets.only(bottom: kPadding12),
                            child: CustomButton(
                              title: 'Upload',
                              onClick: () {
                                readCsvVm.uploadToFireStore();

                                /*  if(readCsvVm.mCsvList.isNotEmpty) {
                                  readCsvVm.addToFireStore();
                                } else {
                                  Get.snackbar("No Data to Uplaod", "Please Fill Data");
                                }*/

                              },
                              buttonColor: Theme.of(context).primaryColor,
                              textColor:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          )
                        : const SizedBox(),
                  )
                ],
              ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
            backgroundColor: readCsvVm.mCsvList.isNotEmpty
                ? Theme.of(context).errorColor
                : Theme.of(context).primaryColor,
            onPressed: readCsvVm.mCsvList.isNotEmpty
                ? readCsvVm.deleteAllCsvData
                : readCsvVm.loadCsv,
            child:
                Icon(readCsvVm.mCsvList.isNotEmpty ? Icons.delete : Icons.add)),
      ),
    );
  }
}
