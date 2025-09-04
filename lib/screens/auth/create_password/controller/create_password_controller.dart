import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    emailController.text = Get.arguments;
    super.onInit();
  }

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final RxString passwordError = "".obs;
  final RxString confirmPasswordError = "".obs;

  bool validatePasswords() {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // reset errors first
    passwordError.value = "";
    confirmPasswordError.value = "";

    if (password.isEmpty) {
      passwordError.value = "Password cannot be empty";
    } else if (password.length < 8) {
      passwordError.value = "Password must be at least 8 characters";
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = "Confirm Password cannot be empty";
    } else if (confirmPassword.length < 8) {
      confirmPasswordError.value = "Confirm Password must be at least 8 characters";
    } else if (password != confirmPassword) {
      confirmPasswordError.value = "Passwords do not match";
    }

    return passwordError.value.isEmpty && confirmPasswordError.value.isEmpty;
  }
}
