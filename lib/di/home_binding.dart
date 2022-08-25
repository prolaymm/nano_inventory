import 'package:get/get.dart';
import 'package:nano_inventory/view_model/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => HomeViewModel());
  }


}