import 'package:flutter/material.dart';
import 'package:nano_inventory/utils/dimens.dart';

import '../../core/vos/drop_down_vo.dart';
import 'text_view.dart';


class CustomDropDownButton extends StatelessWidget {
  final String hintText;
  final DropDownVo? value;
  final bool isSelected;
  final Function(DropDownVo?)? onChanged;
  final List<DropDownVo> dropDownList;

  const CustomDropDownButton(
      {Key? key,
        required this.hintText,
        this.value,
        required this.dropDownList,
        this.onChanged,
        required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            hint: TextView(
              text: hintText,
              fontSize: k16Font,
              maxLine: 1,
              color: Theme.of(context).hintColor,
            ),
            value: value,
            items: dropDownList.map((vo) {
              return DropdownMenuItem(
                value: vo,
                child: TextView(
                  text: vo.title??"",
                  fontSize: k16Font,
                  textOverflow: TextOverflow.ellipsis,
                  maxLine: 1,
                ),
              );
            }).toList(),
            onChanged: onChanged),
      ),
    );
  }
}