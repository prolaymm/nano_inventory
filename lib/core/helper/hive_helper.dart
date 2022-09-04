import 'package:hive/hive.dart';
import 'package:nano_inventory/core/vos/category_vo.dart';
import 'package:nano_inventory/core/vos/product_vo.dart';
import 'package:nano_inventory/utils/db_constant.dart';

class HiveHelper {
  HiveHelper() {
    _registerBox();
  }

  _registerBox() {
    Hive.registerAdapter(ProductVoAdapter());
    Hive.registerAdapter(HistoryAdapter());
    Hive.registerAdapter(CategoryVoAdapter());
  }

  Future openBox() async {
    await Future.wait([
      Hive.openBox<ProductVo>(hiveProductBox),
      Hive.openBox<CategoryVo>(hiveCategoryBox),
    ]);
  }
}
