import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/drop_down_vo.dart';
import 'package:nano_inventory/presentation/widget/custom_drop_down_button.dart';
import 'package:nano_inventory/utils/const_company_list.dart';
import '../../../utils/dimens.dart';
import '../../../view_model/add_product_view_model.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/quick_betting_bottom_sheet.dart';
import '../../widget/text_view.dart';

class CompanyDropDown extends StatelessWidget {
  final AddProductViewModel addProductVm;

  const CompanyDropDown({Key? key, required this.addProductVm})
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
                const TextView(text: "Please Select Company",fontSize: k18Font,fontWeight: FontWeight.bold,),
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
          Flexible(child: _companyListWidget(addProductVm: addProductVm,)),
          const SizedBox(height: kPadding8,),

        ],
      ),

          context: context, height: Get.height/1.4),
      child: SizedBox(
          height: 45,
          child: CustomTextFormField(
            isEnable: false,
            textController:
            addProductVm.companyTextController,
            hintText: "Company",
            label: "Company",
          )
      ),
    );

  }
}


Widget _companyListWidget({required AddProductViewModel addProductVm}) {

  return ListView.builder(
      itemCount: companyList.length,
      itemBuilder: (context, index) {


        return GestureDetector(
          onTap: (){
            addProductVm.companyTextController.text =companyList[index];

            Get.back();
          },
          child: Container(
              padding: const EdgeInsets.all(kPadding16),
              margin: const EdgeInsets.symmetric(
                  horizontal: kPadding8, vertical: 4),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      spreadRadius: 4,
                      blurRadius: 4,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: "Company",
                    fontSize: kPadding12,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(
                    width: kPadding8,
                  ),
                  TextView(
                    text: companyList[index],
                    fontSize: kPadding16,
                    fontWeight: FontWeight.bold,
                  )
                ],
              )),
        );
      });
}
