import 'package:get/get.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';

import '../core/helper/auth_helper.dart';

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
      "onClick": () => Get.toNamed(AppRouteName.rCategory)
    },
    {
      "icon": "assets/lottes/stock.json",
      "title": "Stock",
      "onClick": () => Get.toNamed(AppRouteName.rStockLeft)
    },
  ];


  onLogOut() {

    AuthHelper().deleteAuthToken();
    Get.offAndToNamed(AppRouteName.rLogin);
  }
}
