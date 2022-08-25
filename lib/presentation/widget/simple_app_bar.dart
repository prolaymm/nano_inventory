import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget{

  final String title;
  final bool? isArrow;
  final List<Widget>? action;
  const SimpleAppBar({Key? key, required this.title, this.isArrow, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("hello world"),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const  Size.fromHeight(58);
}
