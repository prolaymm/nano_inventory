import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/custom_text_form_field.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/add_product_view_model.dart';

import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addProductVm = Get.find<AddProductViewModel>();
    addProductVm.onFailTryAgain();
    addProductVm.isSuccess.value = false;
    return Scaffold(
        appBar: const SimpleAppBar(
          title: 'Add Product',
          isBack: true,
        ),
        body: Obx(
          () => addProductVm.isLoading.isTrue
              ? const Center(
                  child: InfoWidget(
                    title: "",
                    isLottie: true,
                    lottieFile: "assets/icons/lottie_loading.json",
                    isButton: false,
                  ),
                )
              : addProductVm.isError.isTrue
                  ? InfoWidget(
                      title:
                          "Error!!!!\nSomething Gone Wrong with Internet or Server",
                      isLottie: true,
                      lottieSize: 100,
                      lottieFile: "assets/icons/lottie_error.json",
                      isButton: true,
                      onClick: () => addProductVm.onFailTryAgain,
                      buttonText: "Try Again",
                    )
                  : addProductVm.isSuccess.isTrue
                      ? InfoWidget(
                          title: "Successfully Added",
                          isLottie: true,
                          lottieSize: 100,
                          lottieFile: "assets/icons/lottie_success.json",
                          isButton: true,
                          onClick: () => addProductVm.isSuccess.value = false,
                          buttonText: "Add More",
                        )
                      : Form(
                          key: addProductVm.formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPadding16),
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: kPadding16,
                                ),
                                SizedBox(
                                    height: 45,
                                    child: CustomTextFormField(
                                      textController:
                                          addProductVm.brandNameTextController,
                                      hintText: "Brand Name",
                                      label: "Brand Name",
                                    )),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                SizedBox(
                                    height: 45,
                                    child: CustomTextFormField(
                                      textController:
                                          addProductVm.itemNameTextController,
                                      hintText: "Item Name",
                                      label: "Item Name",
                                    )),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                SizedBox(
                                    height: 45,
                                    child: CustomTextFormField(
                                      textController:
                                          addProductVm.itemCodeTextController,
                                      hintText: "Item Code",
                                      label: "Item Code",
                                    )),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                SizedBox(
                                    height: 45,
                                    child: CustomTextFormField(
                                      textController:
                                          addProductVm.categoryTextController,
                                      hintText: "Category",
                                      label: "Category",
                                    )),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => addProductVm
                                            .incrementDecrementQuantity(
                                                isIncrement: true,
                                                controller: addProductVm
                                                    .quantityTextController),
                                        child: const CircleAvatar(
                                          radius: 15,
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                          height: 45,
                                          child: CustomTextFormField(
                                            textController: addProductVm
                                                .quantityTextController,
                                            inputType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            hintText: "Alert Quantity",
                                            label: "Alert Quantity",
                                          )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => addProductVm
                                            .incrementDecrementQuantity(
                                                isIncrement: false,
                                                controller: addProductVm
                                                    .quantityTextController),
                                        child: const CircleAvatar(
                                          radius: 15,
                                          child: Icon(
                                            Icons.remove,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                CustomTextFormField(
                                  textController:
                                      addProductVm.descriptionTextController,
                                  hintText: "Description",
                                  label: "Description",
                                  isMulti: true,
                                ),
                                const SizedBox(
                                  height: kPadding18,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => addProductVm
                                            .incrementDecrementQuantity(
                                                isIncrement: true,
                                                controller: addProductVm
                                                    .alertQuantityTextController),
                                        child: const CircleAvatar(
                                          radius: 15,
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                          height: 45,
                                          child: CustomTextFormField(
                                            textController: addProductVm
                                                .alertQuantityTextController,
                                            inputType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            hintText: "Alert Quantity",
                                            label: "Alert Quantity",
                                          )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () => addProductVm
                                            .incrementDecrementQuantity(
                                                isIncrement: false,
                                                controller: addProductVm
                                                    .alertQuantityTextController),
                                        child: const CircleAvatar(
                                          radius: 15,
                                          child: Icon(
                                            Icons.remove,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                              ],
                            ),
                          ),
                        ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => addProductVm.isLoading.isFalse &&
                  addProductVm.isError.isFalse &&
                  addProductVm.isSuccess.isFalse
              ? SizedBox(
                  width: 200,
                  child: CustomButton(
                    title: 'Upload',
                    onClick: () {
                      if (addProductVm.formKey.currentState!.validate()) {
                        addProductVm.uploadToFirebase();
                      }
                    },
                    buttonColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                )
              : const SizedBox(),
        ));
  }
}
