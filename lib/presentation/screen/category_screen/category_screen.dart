import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/persistance/category_db.dart';
import 'package:nano_inventory/core/vos/category_vo.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/category_view_model.dart';

import '../../widget/custom_text_form_field.dart';
import '../../widget/info_widget.dart';
import '../../widget/simple_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryVm = Get.find<CategoryViewModel>();

    print(CategoryDb().getAllCategory());
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Category', isBack: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            print(CategoryDb().getAllCategory());
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];


                CategoryDb().saveCategory(
                      category: CategoryVo(id: doc.id, title: doc["type"]));
                  return Container(
                      padding: const EdgeInsets.all(kPadding16),
                      margin: const EdgeInsets.symmetric(
                          horizontal: kPadding16, vertical: 4),
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
                      ));
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
        onPressed: () async {
          _showTextInputDialog(context, categoryVm);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<String?> _showTextInputDialog(
    BuildContext context, CategoryViewModel categoryVm) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: const Text('Add New Category'),
          content: Form(
            key: categoryVm.formKey,
            child: SizedBox(
                height: 45,
                child: CustomTextFormField(
                  textController: categoryVm.categoryTextController,
                  hintText: "Category Name",
                  label: "Category Name",
                )),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: TextView(
                  text: "Cancel",
                  color: Theme.of(context).textTheme.bodyText1!.color),
              onPressed: () => Get.back(),
            ),
            ElevatedButton(
              child: TextView(
                  text: "Okay",
                  color: Theme.of(context).textTheme.bodyText1!.color),
              onPressed: () {
                if (categoryVm.formKey.currentState!.validate()) {
                  categoryVm.addCategoryToFireStore();
                  Get.back();
                }
              },
            ),
          ],
        );
      });
}
