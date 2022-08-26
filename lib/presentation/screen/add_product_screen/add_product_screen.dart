import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/custom_text_form_field.dart';
import 'package:nano_inventory/utils/dimens.dart';

import '../../widget/simple_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextController = TextEditingController();
    return Scaffold(
        appBar: const SimpleAppBar(
          title: 'Add Product',
          isBack: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: ListView(
            children: [
              const SizedBox(
                height: kPadding16,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: nameTextController,
                    hintText: "name",
                    label: "Product",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    textController: nameTextController,
                    hintText: "Product Code",
                    label: "Product Code",
                  )),
              const SizedBox(
                height: kPadding18,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => print("hello wolrd"),
                      child: const CircleAvatar(
                        radius: 15,
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                        height: 45,
                        child: CustomTextFormField(
                          textController: nameTextController,
                          hintText: "Count",
                          label: "Count",
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => print("hello wolrd"),
                      child: const CircleAvatar(
                        radius: 15,
                        child: Icon(
                          Icons.remove,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
