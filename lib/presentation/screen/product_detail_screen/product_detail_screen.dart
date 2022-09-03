
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/simple_app_bar.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

import '../../../core/vos/product_vo.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> argumentData =  Get.arguments??{};
    ProductVo vo = argumentData["vo"]??ProductVo(qty: 0,alertCount: 0);
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Product Detail',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: ListView(
          children: [
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Brand Name",title: vo.brand??""),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Item Name",title: vo.itemName??""),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Product Code",title: vo.code??""),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Total Item",title: "${vo.qty}"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Add By",title: vo.addBy??"_"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Created Date",title:vo.createdTime??"_"),

            const SizedBox(
              height: 8,
            ),
          const  Divider(
              height: 2,
            ),
            const SizedBox(
              height: 8,
            ),
           const TextView(
              text: "Description",
              fontSize: k18Font,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
               TextView(
              text: vo.description??"_",
              fontSize: k14Font,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 8,
            ),
            const  Divider(
              height: 2,
            ),
            const SizedBox(
              height: 8,
            ),
            const TextView(
              text: "History",
              fontSize: k18Font,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
                shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                itemCount: vo.history?.length,
                itemBuilder: (_,position) {
              return Container(

                padding: const EdgeInsets.all(8),

                  margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [

                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                        spreadRadius: 4
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      _rowText(context: context,hint: "Edit By",title:vo.history?[position].editBy??"_"),
                     const SizedBox(height: kPadding8,),
                      _rowText(context: context,hint: "Date",title: vo.history?[position].editDate??"_"),
                      const SizedBox(height: kPadding8,),
                      _rowText(context: context,hint: "Item",title: vo.history?[position].total.toString()??""),
                    ],
                  ));
            })
          ],
        ),
      ),
    /*    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            width: 200,
            child: CustomButton(
              title: 'Edit',
              onClick: () {

              },
              buttonColor: Theme.of(context).errorColor,

              textColor: Theme.of(context).textTheme.bodyText1!.color,
            ),
          )*/


    );
  }
}

Widget _rowText(
    {required context, required String hint, required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextView(
        text: hint,
        fontSize: k14Font,
        color: Theme.of(context).hintColor,
      ),
      TextView(
        text: title,
        fontSize: k16Font,
        fontWeight: FontWeight.bold,
      ),
    ],
  );
}
