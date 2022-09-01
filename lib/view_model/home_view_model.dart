import 'package:get/get.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';

class HomeViewModel extends GetxController {
  List<Map<String, dynamic>> mHomeCategory = [
    {
      "icon": "assets/lottes/product.json",
      "title": "Product",
      "onClick": () => Get.toNamed(AppRouteName.rProduct)
    },
    {
      "icon": "assets/icons/add_product.json",
      "title": "Add Product",
      "onClick": () => Get.toNamed(AppRouteName.rAddProduct)
    },
    {
      "icon": "assets/lottes/lottie_categories.json",
      "title": "Category",
      "onClick": () => print("hello world")
    },
    {
      "icon": "assets/lottes/stock.json",
      "title": "Stock",
      "onClick": () => print("hello world")
    },
  ];
}
