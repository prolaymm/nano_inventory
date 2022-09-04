
import 'package:flutter/material.dart';
import 'package:nano_inventory/utils/dimens.dart';

void quickBettingBottomSheet({required BuildContext context,required Widget child,required double height}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape:const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(16),
          topRight: Radius.circular(16)),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
          width: double.infinity,
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: kPadding12,right: kPadding12,top: kPadding12,),
            child: child,
          ));
    },
  );
}
