import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/drop_down_vo.dart';
import 'package:nano_inventory/view_model/add_product_view_model.dart';

import '../../widget/custom_drop_down_button.dart';
import '../../widget/text_view.dart';

class CategoryDropDown extends StatelessWidget {
  final AddProductViewModel addProductVm;

  const CategoryDropDown({Key? key, required this.addProductVm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('category').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DropDownVo> categoryList = [];


          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            DocumentSnapshot doc = snapshot.data!.docs[i];

            categoryList.add(DropDownVo(title: doc["type"]));
          }

          return Obx(
            () => CustomDropDownButton(
              hintText: "Select Category",
              dropDownList: const [],
              value: addProductVm.isDropDownCategoryNull.isTrue
                  ? addProductVm.nullCategoryDropDown.value
                  : addProductVm.dropDownCategoryValue.value,

              //  onChanged:addProductVm.onDropDownChange(),
              isSelected: addProductVm.nullCategoryDropDown.value,
            ),
          );
        }
        if (snapshot.hasError) {
          return const TextView(text: "Error on Category");
        } else {
          return const TextView(text: "No Category Found");
        }
      },
    );
  }
}
