import 'dart:io';
import 'package:curatrail/screens/auth/create_password/controller/create_password_controller.dart';
import 'package:curatrail/screens/auth/create_password/widgets/account_creation_bottomsheet.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(isHideBackButton: true),
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
                          AppStrings.thankYouForVerification.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 24,
                            color: AppColors.color333333,
                          ),
                        ),

                        SizedBox(height: Get.height * .02),

                        CommonTextField(
                          readOnly: true,
                          enable: false,
                          fieldTitle: AppStrings.email.tr,
                          controller: controller.emailController,
                        ),

                        SizedBox(height: 15),

                        CommonTextField(
                          showInfoIcon: true,
                          hintText: "········",
                          hintStyle: Get.textTheme.titleLarge?.copyWith(
                            color: AppColors.color9A9A9A,
                            fontSize: 30 ,
                          ),
                          obscureText: !controller.isPasswordVisible.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: controller.isPasswordVisible.value ? SvgPicture.asset(AppAssets.openEyeIcon) : SvgPicture.asset(AppAssets.closeEyeIcon),
                            ),
                          ),
                          fieldTitle: AppStrings.password.tr,
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
                            fontSize: 30 ,
                          ),
                          obscureText: !controller.isConfirmPasswordVisible.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isConfirmPasswordVisible.value = !controller.isConfirmPasswordVisible.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: controller.isConfirmPasswordVisible.value ? SvgPicture.asset(AppAssets.openEyeIcon) : SvgPicture.asset(AppAssets.closeEyeIcon),
                            ),
                          ),
                          fieldTitle: AppStrings.confirmPassword.tr,
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
                  title: AppStrings.register.tr,
                  onTapButton: () async {
                    if (controller.validatePasswords()) {
                      await AccountCreationBottomSheet.show(context);
                      debugPrint("Validate");
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
