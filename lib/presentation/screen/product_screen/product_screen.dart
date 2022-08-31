import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/product_vo.dart';
import 'package:nano_inventory/presentation/widget/product_container.dart';
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
                              child: GestureDetector(
                                onTap:()=>  Get.toNamed(AppRouteName.rSearch),
                                child: CustomTextFormField(

                                  isEnable: false,
                                  textController: productVm.searchTextController,
                                  hintText: "Search",
                                  label: "Search",
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).hintColor,
                                  ),
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
                                        onTap: () => Get.toNamed(
                                                AppRouteName.rProductDetail,
                                                arguments: {
                                                  "vo": productVm
                                                      .mProductList[position],
                                                }),
                                        child: ProductContainer(
                                          vo: productVm.mProductList[position],
                                        ));
                                  }),
                            ),
                          ],
                        ),
        ),
      ),
    );
  }
}
