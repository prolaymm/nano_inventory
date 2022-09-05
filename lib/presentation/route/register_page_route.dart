import 'package:get/get.dart';
import 'package:nano_inventory/di/add_product_binding.dart';
import 'package:nano_inventory/di/category_binding.dart';
import 'package:nano_inventory/di/home_binding.dart';
import 'package:nano_inventory/di/product_binding.dart';
import 'package:nano_inventory/di/search_binding.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/presentation/screen/add_product_screen/add_product_screen.dart';
import 'package:nano_inventory/presentation/screen/auth_screens/add_user_info_screen/add_user_info_screen.dart';
import 'package:nano_inventory/presentation/screen/category_screen/category_screen.dart';
import 'package:nano_inventory/presentation/screen/home_screen/home_screen.dart';
import 'package:nano_inventory/presentation/screen/product_detail_screen/product_detail_screen.dart';
import 'package:nano_inventory/presentation/screen/product_screen/product_screen.dart';
import 'package:nano_inventory/presentation/screen/search_screen/search_screen.dart';
import 'package:nano_inventory/presentation/screen/stock_left_screen/stock_left_screen.dart';


import '../../di/login_binding.dart';
import '../screen/auth_screens/login_screen/login_screen.dart';
import '../screen/test_screen/drop_down_test/drop_down_test.dart';


class RegisterPageRoute {

  var getPages = [
    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRouteName.rAddProduct, page: ()=> const AddProductScreen(),binding: AddProductBinding()),
    GetPage(name: AppRouteName.rProduct, page: ()=> const ProductScreen(),binding: ProductBinding()),
    GetPage(name: AppRouteName.rProductDetail, page: ()=> const ProductDetailScreen()),
    GetPage(name: AppRouteName.rSearch, page: ()=> const SearchScreen(),binding: SearchBinding()),
    GetPage(name: AppRouteName.rCategory, page: ()=> const CategoryScreen(),binding: CategoryBinding()),
    GetPage(name: AppRouteName.rLogin, page: ()=> const LoginScreen(),binding: LoginBinding()),
    GetPage(name: AppRouteName.rUpdateUserInfo, page: ()=> const UpdateUserInfoScreen(),binding: LoginBinding()),
    GetPage(name: AppRouteName.rTest, page: ()=> const DropDownTest(),binding: AddProductBinding()),
    GetPage(name: AppRouteName.rStockLeft, page: ()=> const StockLeftScreen()),


  ];
}