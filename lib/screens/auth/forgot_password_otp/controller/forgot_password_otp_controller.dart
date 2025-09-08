import 'dart:async';

import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpController extends GetxController {
  static ForgotPasswordOtpController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }

  TextEditingController otpController = TextEditingController();

  RxString otpError = "".obs;

  otpValidation () {
    if(otpController.text.isEmpty) {
      otpError.value = AppStrings.otpCanNotBeEmpty.tr;
    } else if (otpController.text.length < 6) {
      otpError.value = AppStrings.otp6CharError.tr;
    } else {
      otpError.value = "";
    }
  }

  validator () async {
    await otpValidation();

    if(otpError.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  RxInt seconds = 30.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    seconds.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }


}