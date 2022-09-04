
import 'package:hive/hive.dart';
import 'package:nano_inventory/utils/db_constant.dart';
part 'category_vo.g.dart';
@HiveType(typeId: hiveCategoryId)
class CategoryVo {

  @HiveField(0)
  String? title;
  @HiveField(1)
  String? id;
  CategoryVo({this.title,this.id});

  @override
  String toString() {
    // TODO: implement toString
    return {'id': id, 'name': title}.toString();
  }
}