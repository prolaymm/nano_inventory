import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nano_inventory/core/vos/product_vo.dart';
import 'package:nano_inventory/presentation/widget/product_container.dart';

import '../../../utils/dimens.dart';
import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';
import '../../widget/text_view.dart';

class StockLeftScreen extends StatelessWidget {
  const StockLeftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ProductVo vo = ProductVo();
            List<DocumentSnapshot<Map<String, dynamic>>> documentSnapshot =
                snapshot.data!.docs
                    as List<DocumentSnapshot<Map<String, dynamic>>>;

            List<ProductVo> filterList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              if (documentSnapshot[i]["qty"] <=
                  documentSnapshot[i]["alert_count"]) {
                ProductVo vo =
                    ProductVo.fromDocumentSnapshot(documentSnapshot[i]);
                print(vo);
                filterList.add(vo);
              }
            }

            return filterList.isEmpty
                ? const InfoWidget(
                    title: "Data Not Found!!!\n There is not data found",
                    image: "assets/images/empty.png",
                    isButton: false,
                  )
                : ListView.builder(
                    itemCount: filterList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      DocumentSnapshot<Map<String, dynamic>> docData =
                          doc as DocumentSnapshot<Map<String, dynamic>>;

                      return ProductContainer(vo: filterList[index]);
                    });
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
    );
  }
}
