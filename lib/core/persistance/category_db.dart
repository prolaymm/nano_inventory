import 'package:hive/hive.dart';
import 'package:nano_inventory/core/vos/category_vo.dart';

import 'package:nano_inventory/core/vos/category_vo.dart';

import 'package:nano_inventory/core/vos/category_vo.dart';

import 'package:nano_inventory/core/vos/category_vo.dart';
import 'package:nano_inventory/utils/db_constant.dart';

class CategoryDb {
  static final CategoryDb _singleton = CategoryDb._internal();

  CategoryDb._internal();

  factory CategoryDb() {
    return _singleton;
  }

  Future<void> saveCategory({required CategoryVo category}) async {
    getCategoryBox().put(category.id, category);
  }

  List<CategoryVo> getAllCategory() {
    return getCategoryBox().values.toList().isEmpty
        ? []
        : getCategoryBox().values.toList();
  }

  Future deleteAllCategory() {
    return getCategoryBox().deleteAll(getCategoryBox().keys);
  }

  Box<CategoryVo> getCategoryBox() {
    return Hive.box<CategoryVo>(hiveCategoryBox);
  }
}
