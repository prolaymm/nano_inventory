import 'package:flutter/material.dart';
import 'package:nano_inventory/presentation/widget/simple_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: SimpleAppBar(title: '', action: [],),
      body: const   Text("hello world"),
    );
  }
}
