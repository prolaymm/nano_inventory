import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/add_product_view_model.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/quick_betting_bottom_sheet.dart';
import '../../widget/text_view.dart';
import 'category_lists.dart';

class CategoryDropDown extends StatelessWidget {
  final AddProductViewModel addProductVm;

  const CategoryDropDown({Key? key, required this.addProductVm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=> quickBettingBottomSheet(child:
      Column(
        children: [
          const SizedBox(height: kPadding8,),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: kPadding8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(text: "Please Select Category",fontSize: k18Font,fontWeight: FontWeight.bold,),
                GestureDetector(
                  onTap: ()=> Get.back(),
                  child: SizedBox(
                      height: 40,width: 50,
                      child: Icon(Icons.close_rounded,color: Theme.of(context).errorColor,)),
                )
              ],
            ),
          ),
          const SizedBox(height: kPadding12,),
          Flexible(child: CategoryList(addProductVm: addProductVm,)),
          const SizedBox(height: kPadding8,),
          SizedBox(
            width: 200,
            child: CustomButton(
              title: 'Add Category',
              onClick: () => Get.toNamed(AppRouteName.rCategory),
              buttonColor: Theme.of(context).errorColor,
              textColor: Theme.of(context).textTheme.bodyText1!.color,
            ),
          )
        ],
      ),

          context: context, height: Get.height/1.4),
      child: SizedBox(
          height: 45,
          child: CustomTextFormField(
            isEnable: false,
            textController:
            addProductVm.categoryTextController,
            hintText: "Category",
            label: "Category",
          )
      ),
    );

  }
}
