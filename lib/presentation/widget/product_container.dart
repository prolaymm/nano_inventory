import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/row_text.dart';


import '../../core/vos/product_vo.dart';
import '../../utils/dimens.dart';
import '../route/app_route_name.dart';

class ProductContainer extends StatelessWidget {
  final ProductVo vo;
  final bool? isReadFromCsv;

  const ProductContainer({
    Key? key,
    required this.vo,
    this.isReadFromCsv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 8, bottom: 6, left: kPadding16, right: kPadding16),
      padding: const EdgeInsets.all(kPadding12),
      decoration: BoxDecoration(
          color: vo.qty!<= vo.alertCount! ?const Color(0xfffae0e4)  : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              spreadRadius: 4,
              blurRadius: 4,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowText(
              context: context, hint: "Category", title: vo.category ?? "_"),
          const SizedBox(
            height: 6,
          ),
          rowText(context: context, hint: "Brand Name", title: vo.brand ?? ""),
          const SizedBox(
            height: 6,
          ),
          rowText(context: context, hint: "Product Code", title: vo.code ?? ""),
          const SizedBox(
            height: 6,
          ),

          const SizedBox(
            height: 6,
          ),
          rowText(context: context, hint: "Item Left", title: "${vo.qty??""} Items"),
          const SizedBox(
            height: 6,
          ),
          rowText(context: context, hint: "Alert Qty", title: "${vo.alertCount??""} Items" ),
           SizedBox(
            height: isReadFromCsv !=true? 12 : 0,
          ),
          if(isReadFromCsv !=true)    SizedBox(
            height: 35,
            width: double.infinity,
            child: CustomButton(
              onClick: () => Get.toNamed(AppRouteName.rAddProduct,
                  arguments: {
                    "vo": vo,
                    "isUpdate": true
                  }),
              title: "Edit",
              buttonColor:  vo.qty!<= vo.alertCount! ? Theme.of(context).colorScheme.primaryContainer  : Theme.of(context).colorScheme.error,
              textColor:vo.qty!<= vo.alertCount!?  Theme.of(context).errorColor : Theme.of(context).colorScheme.primaryContainer,
            ),
          )
        ],
      ),
    );
  }
}
