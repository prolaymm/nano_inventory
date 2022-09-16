import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nano_inventory/presentation/widget/simple_app_bar.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';
import 'package:nano_inventory/view_model/home_view_model.dart';

import '../../widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeVm = Get.find<HomeViewModel>();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Home Screen',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: homeVm.mHomeCategory.length,
                  itemBuilder: (_, position) {
                    return GestureDetector(
                      onTap: homeVm.mHomeCategory[position]["onClick"],
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: kPadding12, horizontal: kPadding12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.shadow,
                                spreadRadius: 4,
                                blurRadius: 4,
                              )
                            ]),
                        child: Column(
                          children: [
                            Lottie.asset(homeVm.mHomeCategory[position]["icon"],
                                width: 100, height: 100),
                            const SizedBox(
                              height: 4,
                            ),
                            TextView(
                              text: "${homeVm.mHomeCategory[position]["title"]}",
                              fontWeight: FontWeight.bold,
                              fontSize: kPadding16,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 35,
              margin: const  EdgeInsets.all(kPadding12),
              width: double.infinity,
              child: CustomButton(
                onClick: homeVm.onLogOut,
                title: "Log Out",
                buttonColor:  Theme.of(context).colorScheme.error,
                textColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
