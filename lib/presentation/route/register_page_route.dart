import 'package:get/get.dart';
import 'package:nano_inventory/di/add_product_binding.dart';
import 'package:nano_inventory/di/category_binding.dart';
import 'package:nano_inventory/di/home_binding.dart';
import 'package:nano_inventory/di/product_binding.dart';
import 'package:nano_inventory/di/search_binding.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/presentation/screen/add_product_screen/add_product_screen.dart';
import 'package:nano_inventory/presentation/screen/category_screen/category_screen.dart';
import 'package:nano_inventory/presentation/screen/home_screen/home_screen.dart';
import 'package:nano_inventory/presentation/screen/product_detail_screen/product_detail_screen.dart';
import 'package:nano_inventory/presentation/screen/product_screen/product_screen.dart';
import 'package:nano_inventory/presentation/screen/search_screen/search_screen.dart';
import 'package:nano_inventory/view_model/search_view_model.dart';

class RegisterPageRoute {

  var getPages = [
    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRouteName.rAddProduct, page: ()=> const AddProductScreen(),binding: AddProductBinding()),
    GetPage(name: AppRouteName.rProduct, page: ()=> const ProductScreen(),binding: ProductBinding()),
    GetPage(name: AppRouteName.rProductDetail, page: ()=> const ProductDetailScreen()),
    GetPage(name: AppRouteName.rSearch, page: ()=> const SearchScreen(),binding: SearchBinding()),
    GetPage(name: AppRouteName.rCategory, page: ()=> const CategoryScreen(),binding: CategoryBinding()),
  ];
}