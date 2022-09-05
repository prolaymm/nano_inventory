import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/drop_down_vo.dart';
import 'package:nano_inventory/presentation/widget/custom_drop_down_button.dart';
import '../../../view_model/add_product_view_model.dart';

class CompanyDropDown extends StatelessWidget {
  final AddProductViewModel addProductVm;

  const CompanyDropDown({Key? key, required this.addProductVm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      builder: (controller) {
        return CustomDropDownButton(
            hintText: "Select Company",
            dropDownList: controller.testVo,
            isSelected: true,
            value: controller.officeDropDown,
            onChanged: (DropDownVo? newServer) {
              print(newServer);
              controller.companyTextController.text = newServer!.title!;
              controller.onDropDownChange(newServer);
            });
      },
    );
  }
}
