import 'package:get/get.dart';

import '../view_model/category_view_model.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CategoryViewModel());
  }


}