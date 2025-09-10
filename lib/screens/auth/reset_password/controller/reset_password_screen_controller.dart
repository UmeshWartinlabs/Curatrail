import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {
  static ResetPasswordScreenController get to => Get.find();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxString passwordError = "".obs;
  final RxString confirmPasswordError = "".obs;

  bool validatePasswords() {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // reset errors first
    passwordError.value = "";
    confirmPasswordError.value = "";

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~^%+=?<>_\-]).{8,}$');

    if (password.isEmpty) {
      passwordError.value = AppStrings.passwordCanNotBeEmpty.tr;
    } else if (password.length < 8) {
      passwordError.value = AppStrings.passwordMustBe8Char.tr;
    } else if (!passwordRegex.hasMatch(password)) {
      passwordError.value = AppStrings.passwordInvalidFormat.tr;
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = AppStrings.confirmPasswordCanNotBeEmpty.tr;
    } else if (confirmPassword.length < 8) {
      confirmPasswordError.value = AppStrings.confirmPasswordMustBe8Char.tr;
    } else if (password != confirmPassword) {
      confirmPasswordError.value = AppStrings.passwordsDoNotMatch.tr;
    }

    return passwordError.value.isEmpty && confirmPasswordError.value.isEmpty;
  }

}