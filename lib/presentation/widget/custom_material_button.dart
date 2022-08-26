import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final Color? borderColor;
  final double? height;

  const CustomMaterialButton(
      {Key? key,
      required this.onClick,
      required this.title,
      this.buttonColor,
      this.textColor,
      this.radius,
      this.width,
      this.height,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      color: buttonColor,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 40),
          side:
              BorderSide(color: borderColor ?? Theme.of(context).primaryColor)),
      child: TextView(text: title, color: textColor),
    );
  }
}
