import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();

  final TextEditingController emailController = TextEditingController();

  RxString emailError = "".obs;

  emailValidation() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = AppStrings.emailEmptyError;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = AppStrings.validEmailError;
    } else {
      emailError.value = "";
    }
  }

  validator () async {
    await emailValidation();

    if(emailError.value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

}