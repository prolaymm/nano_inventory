import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/product_vo.dart';
import 'package:nano_inventory/view_model/product_view_model.dart';

import '../../../utils/dimens.dart';
import '../../route/app_route_name.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';
import '../../widget/text_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productVm = Get.find<ProductViewModel>();



    productVm.fetchDataFromFirebase();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Nano Inventory Product',
        isBack: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => productVm.fetchDataFromFirebase(),
        child: Obx(
          () => productVm.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : productVm.isError.isTrue
                  ? InfoWidget(
                      title:
                          "Error!!!!\nSomething Gone Wrong with Internet or Server",
                      isLottie: true,
                      lottieFile: "assets/icons/lottie_error.json",
                      isButton: true,
                      onClick: () => productVm.fetchDataFromFirebase(),
                      buttonText: "Try Again",
                    )
                  : productVm.mProductList.isEmpty
                      ? InfoWidget(
                          title: "Data Not Found!!!\n There is not data found",
                          image: "assets/images/empty.png",
                          isButton: true,
                          onClick: () => productVm.fetchDataFromFirebase(),
                          buttonText: "Try Again",
                        )
                      : Column(
                          children: [
                            const SizedBox(
                              height: kPadding12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kPadding16),
                              child: Obx(
                                () => CustomTextFormField(
                                  textController:
                                      productVm.searchTextController,
                                  hintText: "Search",
                                  /*  onSuffixIconClick: (){
                      productVm.textController.text = "";
                      productVm.isTextFormFieldEmpty.value = true;
                    },*/
                                  suffixIcon:
                                      productVm.isTextFormFieldEmpty.isTrue
                                          ? Icons.search
                                          : Icons.clear,
                                  onChange: productVm.onTextFormFieldChange,
                                  onFieldSubmitted: productVm.onFieldSubmitted,
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: productVm.mProductList.length,
                                  itemBuilder: (_, position) {
                                    return GestureDetector(
                                      onTap: ()=> print(productVm.mProductList[position].id),
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(context)
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
                                                  text: productVm
                                                          .mProductList[
                                                              position]
                                                          .itemName ??
                                                      "",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: k16Font,
                                                ),
                                                TextView(
                                                  text: productVm
                                                          .mProductList[
                                                              position]
                                                          .createdTime ??
                                                      '',
                                                  color: Theme.of(context)
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
                                                  text: productVm
                                                          .mProductList[
                                                              position]
                                                          .code ??
                                                      "",
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: k14Font,
                                                ),
                                                GestureDetector(
                                                    onTap: () =>Get.toNamed(AppRouteName.rAddProduct,
                                                        arguments: {
                                                              "vo" : productVm
                                                                      .mProductList[
                                                                  position],
                                                          "isUpdate" :     true
                                                            }),
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Theme.of(context)
                                                          .errorColor,
                                                      size: 18,
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            TextView(
                                              text: productVm
                                                      .mProductList[position]
                                                      .brand ??
                                                  "",
                                              color: Theme.of(context)
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
                                              text:"${ productVm.mProductList[position].qty} Items",
                                              color: Theme.of(context)
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
                                  }),
                            ),
                          ],
                        ),
        ),
      ),
    );
  }
}
