import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/view_model/login_view_model.dart';

import '../../../../utils/dimens.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginVm = Get.find<LoginViewModel>();
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
              margin: const EdgeInsets.only(
                  top: 8, bottom: 8, left: kPadding16, right: kPadding16),
              padding: const EdgeInsets.symmetric(
                  horizontal: kPadding12, vertical: kPadding16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      spreadRadius: 4,
                      blurRadius: 4,
                    )
                  ]),
              child: Form(
                   key: loginVm.formKey ,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 80,
                      height: 80,
                    ),
                    const TextView(
                      text: "NANO LABS",
                      color: Colors.red,
                      fontSize: k22Font,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontStyle: FontStyle.italic,
                    ),
                    TextView(
                      text: "We are Team Legends",
                      color: Theme.of(context).hintColor,
                      fontSize: k12Font,
                      letterSpacing: 3,
                      fontStyle: FontStyle.italic,
                    ),
                    const SizedBox(
                      height: kPadding18,
                    ),
                    SizedBox(
                        height: 45,
                        child: CustomTextFormField(
                          textController: loginVm.emailTextController,
                          hintText: "aj@nolabsmm.com",
                          label: "Email",
                        )),
                    const SizedBox(
                      height: kPadding18,
                    ),
                    SizedBox(
                        height: 45,
                        child: CustomTextFormField(
                          textController: loginVm.passwordTextController,
                          hintText: "*******",
                          label: "Password",
                        )),
                    Obx(() => loginVm.isError.isTrue
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextView(
                              text: loginVm.message.value,
                              fontSize: k16Font,
                              color: Theme.of(context).errorColor,
                            ),
                          )
                        : const SizedBox()),
                    const SizedBox(
                      height: kPadding18,
                    ),
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        title: 'Login',
                        onClick: () {
                          //


                          if (loginVm.formKey.currentState!.validate()) {
                            loginVm.onLogin(context: context);
                          }
                        },
                        buttonColor: Theme.of(context).errorColor,
                        textColor: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
