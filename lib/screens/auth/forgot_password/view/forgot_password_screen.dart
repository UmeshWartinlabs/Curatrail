import 'dart:io';
import 'package:curatrail/screens/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:curatrail/screens/auth/forgot_password/widgets/otp_sent_to_email_bottomsheet.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(isTitleWithLogo: true),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * .07),

                        Text(
                          AppStrings.forgotPassword.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 32,
                            color: AppColors.color333333,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          AppStrings.enterYourRegisteredEmail.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            color: AppColors.textLightColor,
                          ),
                        ),

                        SizedBox(height: Get.height * .04),

                        CommonTextField(
                          fieldTitle: AppStrings.email.tr,
                          controller: controller.emailController,
                          onChanged: (value) => controller.emailValidation(),
                          errorText: controller.emailError.value,
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                CommonButton(
                  title: AppStrings.sendCode.tr,
                  onTapButton: () async {
                    if(await controller.validator()) {
                      await OtpSentToEmailBottomSheet.show(context);
                    }
                  },
                ),

                SizedBox(height: Platform.isAndroid ? 10 : 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
