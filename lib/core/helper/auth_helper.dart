import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nano_inventory/utils/db_constant.dart';

class AuthHelper {
  final storage = const FlutterSecureStorage();

  Future<bool> saveAuthToken({required Map<String, dynamic> data}) async {
    try {
      await storage.write(key: sToken, value: jsonEncode(data));

      return true;
    } catch (e) {

      return false;
    }
  }

  Future<void> deleteAuthToken() async {
    await storage.delete(key: sToken);
  }

  Future <String> getAuthToken() async {
    var allValues = await storage.read(key: sToken);


    String resultAuth;
    if (allValues != null) {
      return allValues;
    } else {
      resultAuth = jsonEncode({"token" : "","user_name" : ""});
      return resultAuth;
    }
  }
}
