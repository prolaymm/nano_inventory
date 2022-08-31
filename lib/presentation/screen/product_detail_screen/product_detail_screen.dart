
import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/simple_app_bar.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

import '../../widget/custom_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            _rowText(context: context,hint: "Brand Name",title: "Heawei"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Item Name",title: "P20 Mobile"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Product Code",title: "lmt007"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Total Item",title: "3"),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Add By",title: "Arjun"),
            const SizedBox(
              height: kPadding16,
            ),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Created Date",title: DateTime.now().toString()),
            const SizedBox(
              height: kPadding16,
            ),
            const SizedBox(
              height: kPadding16,
            ),
            _rowText(context: context,hint: "Add By",title: "Arjun"),
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
              text: "Discription",
              fontSize: k18Font,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
               TextView(
              text: "testadad",
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
                itemCount: 20,
                itemBuilder: (_,text) {
              return Container(

                padding: const EdgeInsets.all(8),

                  margin: const EdgeInsets.all(4),
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
                      _rowText(context: context,hint: "Edit By",title: "Arjun"),
                     const SizedBox(height: kPadding8,),
                      _rowText(context: context,hint: "Date",title: "12/489/0404"),
                      const SizedBox(height: kPadding8,),
                      _rowText(context: context,hint: "Item",title: "4"),
                    ],
                  ));
            })
          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            width: 200,
            child: CustomButton(
              title: 'Edit',
              onClick: () {

              },
              buttonColor: Theme.of(context).errorColor,

              textColor: Theme.of(context).textTheme.bodyText1!.color,
            ),
          )


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
        fontSize: k18Font,
        fontWeight: FontWeight.bold,
      ),
    ],
  );
}
