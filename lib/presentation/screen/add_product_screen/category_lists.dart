import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/dimens.dart';
import '../../../view_model/add_product_view_model.dart';
import '../../widget/info_widget.dart';
import '../../widget/text_view.dart';

class CategoryList extends StatelessWidget {
  final AddProductViewModel addProductVm;
  const CategoryList({Key? key, required this.addProductVm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('category').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {


          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];

                return GestureDetector(
                  onTap: (){
                    addProductVm.categoryTextController.text =doc["type"];

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
                            text: "Category",
                            fontSize: kPadding12,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(
                            width: kPadding8,
                          ),
                          TextView(
                            text: doc["type"] ?? "",
                            fontSize: kPadding16,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      )),
                );
              });
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
        } if(snapshot.data?.docs == null) {
          return const Center(child: CircularProgressIndicator(),);

        /*  InfoWidget(
            title: "Data Not Found!!!\n There is not data found",
            image: "assets/images/empty.png",
            isButton: false,
          );*/
        }

        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
