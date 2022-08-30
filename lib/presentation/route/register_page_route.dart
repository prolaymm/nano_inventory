import 'package:get/get.dart';
import 'package:nano_inventory/di/add_product_binding.dart';
import 'package:nano_inventory/di/home_binding.dart';
import 'package:nano_inventory/di/product_binding.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/presentation/screen/add_product_screen/add_product_screen.dart';
import 'package:nano_inventory/presentation/screen/home_screen/home_screen.dart';
import 'package:nano_inventory/presentation/screen/product_screen/product_screen.dart';

class RegisterPageRoute {

  var getPages = [
    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRouteName.rAddProduct, page: ()=> const AddProductScreen(),binding: AddProductBinding()),
    GetPage(name: AppRouteName.rProduct, page: ()=> const ProductScreen(),binding: ProductBinding()),
  ];
}