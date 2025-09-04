import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  static RegistrationController get to => Get.find();

  RxBool isShowToolTip = false.obs;

  TextEditingController emailController = TextEditingController();

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


  TextEditingController phoneNumberController = TextEditingController();

  RxString phoneNumberError = "".obs;

  phoneNumberValidation() {
    String phone = phoneNumberController.text.trim();

    if (phone.isEmpty) {
      phoneNumberError.value = AppStrings.emptyPhoneNoError;
    } else if (!RegExp(r'^\+?[1-9]\d{6,14}$').hasMatch(phone)) {
      phoneNumberError.value = AppStrings.validPhoneNumberError;
    } else {
      phoneNumberError.value = "";
    }
  }

  TextEditingController dateOfBirthController = TextEditingController();

  RxString dateOfBirthError = "".obs;

  dateOfBirthValidation () {
    String dateOfBirth = dateOfBirthController.text.trim();

    if(dateOfBirth.isEmpty) {
      dateOfBirthError.value = AppStrings.emptyDobError;
    } else {
      dateOfBirthError.value = "";
    }
  }

  TextEditingController patientAuthCodeController = TextEditingController();

  RxString patientAuthCodeError = "".obs;

  patientAuthCodeValidation () {
    String patientAuthCode = patientAuthCodeController.text.trim();

    if(patientAuthCode.isEmpty) {
      patientAuthCodeError.value = AppStrings.emptyPatientAuthCodeError;
    } else {
      patientAuthCodeError.value = "";
    }
  }


  validator () async {
    await emailValidation();
    await phoneNumberValidation();
    await dateOfBirthValidation();
    await patientAuthCodeValidation();

    if(emailError.value.isEmpty && phoneNumberError.value.isEmpty && dateOfBirthError.value.isEmpty && patientAuthCodeError.value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}