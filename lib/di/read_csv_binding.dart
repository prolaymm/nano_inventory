import 'package:get/get.dart';

import '../view_model/read_csv_view_model.dart';

class ReadCsvBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => ReadCsvViewModel());
  }

}