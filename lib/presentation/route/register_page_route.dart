import 'package:get/get.dart';
import 'package:nano_inventory/di/home_binding.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/presentation/screen/home_screen/home_screen.dart';

class RegisterPageRoute {

  var getPages = [

    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding())
  ];
}