import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get to => Get.find();

  RxBool isPasswordVisible = false.obs;

  final TextEditingController passwordController = TextEditingController();

  final RxString passwordError = "".obs;

  passwordValidation() {
    String password = passwordController.text.trim();
    passwordError.value = "";

    if (password.isEmpty) {
      passwordError.value = AppStrings.emailEmptyError;
    } else if (password.length < 8) {
      passwordError.value = "Password must be at least 8 characters";
    } else {
      passwordError.value = "";
    }
  }


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
    await passwordValidation();
    await emailValidation();

    if(passwordError.value.isEmpty && emailError.value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}