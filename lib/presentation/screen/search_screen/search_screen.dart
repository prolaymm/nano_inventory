import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nano_inventory/view_model/search_view_model.dart';

import '../../../utils/dimens.dart';
import '../../route/app_route_name.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/info_widget.dart';
import '../../widget/product_container.dart';
import '../../widget/simple_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchVm = Get.find<SearchViewModel>();
    searchVm.getProductList();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Search Screen',
        isBack: true,
      ),
      body: Column(
        children: [

          const SizedBox(
            height: kPadding12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding16),
            child: CustomTextFormField(

              autoFocus: true,
              textController: searchVm.searchTextController,
              hintText: "Search",

              label: "Search",
              suffixIcon: Obx(
                ()=> searchVm.isSearch.isTrue? GestureDetector(

                  onTap: ()=> searchVm.getProductList(),
                  child: Icon(
                    Icons.clear,
                    color: Theme.of(context).errorColor,
                  ),
                ) :  GestureDetector(
                  onTap: (){
                    searchVm.searchFromList();
                 //   searchVm.searchTextController.text = "";
                  },
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).hintColor,
                  ),
                )  ,
              ),
              onChange: searchVm.onTextFormFieldChange,
              onFieldSubmitted: searchVm.onFieldSubmitted,
            ),
          ),
          Flexible(
            child: Obx(
                  () =>  searchVm.mProductList.isEmpty
                  ? InfoWidget(
                title: "Data Not Found!!!\n There is not data found",
                image: "assets/images/empty.png",
                isButton: true,
                onClick: () => searchVm.getProductList(),
                buttonText: "Try Again",
              )
                  : ListView.builder(
                      itemCount: searchVm.mProductList.length,
                      itemBuilder: (_, position) {
                        return GestureDetector(
                            onTap: () => Get.toNamed(
                                AppRouteName.rProductDetail,
                                arguments: {
                                  "vo": searchVm
                                      .mProductList[position],
                                }),
                            child: ProductContainer(
                              vo: searchVm.mProductList[position],
                            ));
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
