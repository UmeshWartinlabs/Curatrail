import 'dart:io';
import 'package:curatrail/screens/auth/forgot_password_otp/widgets/otp_verified_bottomsheet.dart';
import 'package:curatrail/screens/auth/reset_password/controller/reset_password_screen_controller.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreen({super.key});

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
                          AppStrings.resetPassword.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 32,
                            color: AppColors.color333333,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          AppStrings.enterNewPassword.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            color: AppColors.textLightColor,
                          ),
                        ),

                        SizedBox(height: 40),

                        CommonTextField(
                          hintText: "········",
                          hintStyle: Get.textTheme.titleLarge?.copyWith(
                            color: AppColors.color9A9A9A,
                            fontSize: 30,
                          ),
                          obscureText: !controller.isPasswordVisible.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: controller.isPasswordVisible.value
                                  ? SvgPicture.asset(AppAssets.openEyeIcon)
                                  : SvgPicture.asset(AppAssets.closeEyeIcon),
                            ),
                          ),
                          fieldTitle: AppStrings.newPassword.tr,
                          controller: controller.passwordController,
                          onChanged: (value) => controller.validatePasswords(),
                          errorText: controller.passwordError.value,
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: 15),

                        CommonTextField(
                          hintText: "········",
                          hintStyle: Get.textTheme.titleLarge?.copyWith(
                            color: AppColors.color9A9A9A,
                            fontSize: 30,
                          ),
                          obscureText: !controller.isConfirmPasswordVisible.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isConfirmPasswordVisible.value = !controller.isConfirmPasswordVisible.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: controller.isConfirmPasswordVisible.value
                                  ? SvgPicture.asset(AppAssets.openEyeIcon)
                                  : SvgPicture.asset(AppAssets.closeEyeIcon),
                            ),
                          ),
                          fieldTitle: AppStrings.confirmNewPassword.tr,
                          controller: controller.confirmPasswordController,
                          onChanged: (value) => controller.validatePasswords(),
                          errorText: controller.confirmPasswordError.value,
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                CommonButton(
                  title: AppStrings.change.tr,
                  onTapButton: () async {
                    if (controller.validatePasswords()) {
                      await OtpVerifiedBottomSheet.show(context, title: AppStrings.passwordChangeSuccessfully, buttonText: AppStrings.login);
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
