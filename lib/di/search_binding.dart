import 'package:get/get.dart';
import 'package:nano_inventory/view_model/search_view_model.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchViewModel());
  }


}