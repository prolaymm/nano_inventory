import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? isBack;

  const SimpleAppBar({Key? key, required this.title, this.isBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextView(
        text: title,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      leading: isBack ?? false
          ? GestureDetector(
              onTap: () => Get.back(),
              child: const SizedBox(
                  height: 40,
                  width: 60,
                  child: Icon(Icons.arrow_back_ios, size: k24Font)),
            )
          : const SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(58);
}
