import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

import '../../core/validation/form_validation.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final Color? color;
  final String? label;
  final Widget? suffixIcon;
  final TextInputType? inputType;
 final Function(String?)? onChange;
 final bool? isMulti;
 final TextAlign? textAlign;
 final bool? isEnable;
  final String? Function(String?)? validator;

  final VoidCallback? onClick;

 final Function(String?)? onFieldSubmitted;

  const CustomTextFormField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.suffixIcon,
      this.color,
      this.label, this.inputType, this.onChange, this.onFieldSubmitted, this.isMulti, this.textAlign, this.validator, this.isEnable, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      controller: textController,
      keyboardType: inputType,
      enabled: isEnable??true,
      maxLines: isMulti??false? 5:  1,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        hintStyle:
            TextStyle(color: Theme.of(context).hintColor, fontSize: k12Font),
        hintText: hintText,
        label: TextView(
          text: label ?? "",
          fontSize: k12Font,
          textAlign:textAlign ,
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
        suffixIcon: suffixIcon
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator:validator??checkIsEmpty ,
    );
  }
}
