import 'package:get/get.dart';
import 'package:nano_inventory/view_model/add_product_view_model.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddProductViewModel());
  }
}
