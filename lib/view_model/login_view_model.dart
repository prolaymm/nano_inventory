import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/helper/auth_helper.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';

import '../core/service/persistence_service.dart';
import '../presentation/widget/dialogs.dart';

class LoginViewModel extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> userNameFromKey = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  ///for login
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isSuccess = false.obs;

  ///for update User Name
  RxBool isUpdateLoading = false.obs;
  RxBool isUpdateError = false.obs;
  RxString updateMessage = "".obs;

  User? user;

  onLogin({required context}) async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    isSuccess.value = false;
    showLoaderDialog(context);
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailTextController.text,

        ///"prolaymm@gmail.com",

        password: passwordTextController.text,

        //"123456",
      );
      if (userCredential.user?.displayName == null) {
        Get.back();
        Get.toNamed(AppRouteName.rUpdateUserInfo);
      } else {
        Get.delete<PersistenceService>();
        await AuthHelper().saveAuthToken(data: {
          "token": "success",
          "user_name": "${userCredential.user?.displayName}"
        });
        final persistence = Get.put(PersistenceService());
        await persistence.readToken();
        Get.back();
        Get.offAndToNamed(AppRouteName.rHome);
      }
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message.value = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message.value = "Wrong password provided.";
      }
      isLoading.value = false;
      isError.value = true;
      Get.back();
      isSuccess.value = false;
    } catch (error) {
      message.value = "Something gone wrong with Server or internet";
      isLoading.value = false;
      isError.value = true;
      isSuccess.value = false;
      Get.back();
    }
  }

  onUpdateUserInfo({required context}) async {
    try {
      await user?.updateDisplayName(userNameTextController.text);
      await onLogin(context: context);
    } catch (error) {
      message.value = "Something gone wrong with Server or internet";
      isLoading.value = false;
      isError.value = true;
      isSuccess.value = false;
    }
  }
}
