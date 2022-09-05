import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';

import '../../core/vos/product_vo.dart';
import '../../utils/dimens.dart';
import '../route/app_route_name.dart';

class ProductContainer extends StatelessWidget {
  final ProductVo vo;

  const ProductContainer({Key? key, required this.vo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
          AppRouteName.rProductDetail,
          arguments: {
            "vo": vo,
          }),
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(
            top: 8,
            bottom: 6,
            left: kPadding16,
            right: kPadding16),
        padding:
        const EdgeInsets.all(kPadding12),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer,
            borderRadius:
            BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme
                    .of(context)
                    .colorScheme
                    .shadow,
                spreadRadius: 4,
                blurRadius: 4,
              )
            ]),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                TextView(
                  text: vo
                      .itemName ??
                      "",
                  fontWeight: FontWeight.bold,
                  fontSize: k16Font,
                ),
                TextView(
                  text: vo
                      .createdTime ??
                      '',
                  color: Theme
                      .of(context)
                      .hintColor,
                  fontSize: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                TextView(
                  text: vo
                      .code ??
                      "",
                  color: Theme
                      .of(context)
                      .hintColor,
                  fontSize: k14Font,
                ),
                GestureDetector(
                    onTap: () =>
                        Get.toNamed(AppRouteName.rAddProduct,
                            arguments: {
                              "vo": vo,
                              "isUpdate": true
                            }),
                    child: SizedBox(
                      width: 50,
                      height: 25,
                      child: Icon(
                        Icons.edit,
                        color: Theme
                            .of(context)
                            .errorColor,
                        size: 18,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            TextView(
              text: vo
                  .brand ??
                  "",
              color: Theme
                  .of(context)
                  .textTheme
                  .bodyText2!
                  .color,
              fontWeight: FontWeight.bold,
              fontSize: k14Font,
            ),
            const SizedBox(
              height: 6,
            ),
            TextView(
              text: "${ vo.qty} Items",
              color: Theme
                  .of(context)
                  .textTheme
                  .bodyText2!
                  .color,
              fontWeight: FontWeight.bold,
              fontSize: k14Font,
            ),
          ],
        ),
      ),
    );
  }
}
