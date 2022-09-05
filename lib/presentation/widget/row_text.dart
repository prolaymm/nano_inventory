import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';

import '../../utils/dimens.dart';

Widget _rowText(
    {required context, required String hint, required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextView(
        text: hint,
        fontSize: k14Font,
        color: Theme.of(context).hintColor,
      ),
      TextView(
        text: title,
        fontSize: k16Font,
        fontWeight: FontWeight.bold,
      ),
    ],
  );
}