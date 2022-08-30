import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/custom_text_form_field.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/add_product_view_model.dart';

import '../../widget/simple_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addProductVm = Get.find<AddProductViewModel>();

    return Scaffold(
        appBar: const SimpleAppBar(
          title: 'Add Product',
          isBack: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: ListView(
            children: [
              const SizedBox(
                height: kPadding16,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productNameTextController,
                    hintText: "Product Name",
                    label: "Product Name",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productCodeTextController,
                    hintText: "Product Code",
                    label: "Product Code",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productNameTextController,
                    hintText: "Brand",
                    label: "Brand",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productCodeTextController,
                    hintText: "Category",
                    label: "Category",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productNameTextController,
                    hintText: "Item Name",
                    label: "Item Name",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: addProductVm.productCodeTextController,
                    hintText: "Item Code Code",
                    label: "Item Code",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => addProductVm.incrementDecrementQuantity(
                          isIncrement: true),
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
                          textController: addProductVm.quantityTextController,
                          inputType: TextInputType.number,
                          hintText: "Quantity",
                          label: "Quantity",
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => addProductVm.incrementDecrementQuantity(
                          isIncrement: false),
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
                textController: addProductVm.productCodeTextController,
                hintText: "Description",
                label: "Description",
                isMulti: true,
              ),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  width: 120,
                  child: CustomTextFormField(
                    textController: addProductVm.quantityTextController,
                    inputType: TextInputType.number,
                    hintText: "Alert Quantity",
                    label: "Alert Quantity",
                  )),
           const   SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 200,
          child: CustomButton(
            title: 'Upload',
            onClick: () => addProductVm.uploadToFirebase(),
            buttonColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ));
  }
}
