import 'package:hive/hive.dart';
import 'package:nano_inventory/core/vos/product_vo.dart';
import 'package:nano_inventory/utils/db_constant.dart';

class ProductDb {
  static final ProductDb _singleton = ProductDb._internal();

  ProductDb._internal();

  factory ProductDb() {
    return _singleton;
  }

  Future<void> saveProductList({required List<ProductVo> productList}) async {
    getProductBox().addAll(productList);
  }

  List<ProductVo> getAllProduct() {
    return getProductBox().values.toList().isEmpty
        ? []
        : getProductBox().values.toList();
  }

  Future deleteAllProduct() {
    return getProductBox().deleteAll(getProductBox().keys);
  }

  Box<ProductVo> getProductBox() {
    return Hive.box<ProductVo>(hiveProductBox);
  }
}
