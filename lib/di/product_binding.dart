import 'package:get/get.dart';
import 'package:nano_inventory/view_model/product_view_model.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductViewModel());
  }

}