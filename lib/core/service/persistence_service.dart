import 'dart:convert';

import 'package:get/get.dart';

import '../helper/auth_helper.dart';

class PersistenceService extends GetxService {
  AuthHelper handler = AuthHelper();
  Map secureData = {"token": "", "user_name": ""};

  @override
  void onInit() {
    readToken();
    super.onInit();
  }

  readToken() async {
    String jsonData = await handler.getAuthToken();
    secureData = jsonDecode(jsonData);
  }
}
