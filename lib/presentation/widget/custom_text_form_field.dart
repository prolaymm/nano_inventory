import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final Color? color;
  final String? label;
  final IconData? suffixIcon;
  final TextInputType? inputType;
 final Function(String?)? onChange;
 final bool? isMulti;
 final Function(String?)? onFieldSubmitted;

  const CustomTextFormField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.suffixIcon,
      this.color,
      this.label, this.inputType, this.onChange, this.onFieldSubmitted, this.isMulti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: inputType,
      maxLines: isMulti??false? 5:  1,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        hintStyle:
            TextStyle(color: Theme.of(context).hintColor, fontSize: k12Font),
        hintText: hintText,
        label: TextView(
          text: label ?? "",
          fontSize: k12Font,
          color: Theme.of(context).hintColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: color ?? Theme.of(context).primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: color ?? Theme.of(context).primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: color ?? Theme.of(context).primaryColor)),
      ),
    );
  }
}
