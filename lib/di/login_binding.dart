import 'package:get/get.dart';
import 'package:nano_inventory/view_model/login_view_model.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginViewModel());
  }

}