import 'package:get/get.dart';

class HomeViewModel extends GetxController {


  List<Map<String,dynamic>> mHomeCategory = [

    {"icon" : "assets/lottes/product.json","title" : "Product","onClick" : ()=>  print("hello world")},
    {"icon" : "assets/lottes/printer.json","title" : "Print","onClick" : ()=>  print("hello world")},
    {"icon" : "assets/lottes/history.json","title" : "History","onClick" : ()=>  print("hello world")},
    {"icon" : "assets/lottes/stock.json","title" : "Stock","onClick" : ()=>  print("hello world")},
  ];
}