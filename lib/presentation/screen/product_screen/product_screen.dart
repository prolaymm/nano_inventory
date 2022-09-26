import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/persistance/product_db.dart';
import 'package:nano_inventory/presentation/widget/product_container.dart';
import 'package:nano_inventory/view_model/product_view_model.dart';

import '../../../core/vos/product_vo.dart';
import '../../../utils/dimens.dart';
import '../../route/app_route_name.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productVm = Get.find<ProductViewModel>();

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Nano Inventory Product',
        isBack: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('productList').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot<Map<String, dynamic>>> documentSnapshot =
                snapshot.data!.docs
                    as List<DocumentSnapshot<Map<String, dynamic>>>;

            List<ProductVo> productList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              ProductVo vo = ProductVo.fromDocumentSnapshot(documentSnapshot[i]);

              productList.add(vo);

              ProductDb().saveSingleProduct(productVo: vo);
            }
            productList
                .sort((ProductVo a, ProductVo b) => b.code!.compareTo(a.code!));

            return productList.isEmpty
                ? const InfoWidget(
                    title: "Data Not Found!!!\n There is not data found",
                    image: "assets/images/empty.png",
                    isButton: false,
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: kPadding12,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding16),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRouteName.rSearch),
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
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = snapshot.data!.docs[index];
                              DocumentSnapshot<Map<String, dynamic>> docData =
                                  doc as DocumentSnapshot<Map<String, dynamic>>;

                              return GestureDetector(
                                  onTap: () => Get.toNamed(
                                          AppRouteName.rProductDetail,
                                          arguments: {
                                            "vo": productList[index],
                                          }),
                                  child:
                                      ProductContainer(vo: productList[index]));
                            }),
                      ),
                    ],
                  );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: InfoWidget(
                title:
                    "Error!!!!\nSomething Gone Wrong with Internet or Server",
                isLottie: true,
                lottieSize: 100,
                lottieFile: "assets/icons/lottie_error.json",
                buttonText: "Try Again",
              ),
            );
          } else {
            return const InfoWidget(
              title: "Data Not Found!!!\n There is not data found",
              image: "assets/images/empty.png",
              isButton: false,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Get.toNamed(AppRouteName.rAddProduct),
        child: const Icon(Icons.add),
      ),
    );
  }
}
