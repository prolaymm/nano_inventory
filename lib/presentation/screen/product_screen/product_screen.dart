import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/view_model/product_view_model.dart';

import '../../../utils/dimens.dart';
import '../../route/app_route_name.dart';
import '../../widget/custom_cache_network_image.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';
import '../../widget/text_view.dart';

class ProductScreen  extends StatelessWidget {
  const ProductScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productVm = Get.find<ProductViewModel>();
    productVm.fetchDataFromFirebase();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Nano Inventory Product',
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
            title:
            "Data Not Found!!!\n There is not data found",

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
                      ()=>  CustomTextFormField(
                    textController: productVm.searchTextController,
                    hintText: "Search",
                  /*  onSuffixIconClick: (){
                      productVm.textController.text = "";
                      productVm.isTextFormFieldEmpty.value = true;
                    },*/
                    suffixIcon: productVm.isTextFormFieldEmpty.isTrue? Icons.search : Icons.clear,
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

                        child: Container(
                          height: 110,
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
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                            const   SizedBox(
                                height: 80,
                                width: 80,
                                child: CustomCacheNetworkImage(
                                    imageUrl: "https://cdn.pixabay.com/photo/2013/04/25/11/17/cosmetics-106982_960_720.jpg" ,
                                    height: 100,
                                    radius: 12,
                                    boxFit: BoxFit.cover,
                                    width: 100),
                              ),
                              const SizedBox(
                                width: kPadding12,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text:
                                    productVm.mProductList[position].itemName??"",
                                    fontWeight: FontWeight.bold,
                                    fontSize: k16Font,
                                  ),
                                  TextView(
                                    text:
                                    "test",
                                    color: Theme.of(context)
                                        .hintColor,
                                    fontSize: k14Font,
                                  ),
                                  const Spacer(),
                                  Text("hello world")
                                ],
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