import 'dart:io';
import 'package:curatrail/screens/auth/login/controller/login_screen_controller.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

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
                          AppStrings.login.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 32,
                            color: AppColors.color333333,
                          ),
                        ),

                        SizedBox(height: Get.height * .02),

                        CommonTextField(
                          fieldTitle: AppStrings.email.tr,
                          controller: controller.emailController,
                          onChanged: (value) => controller.emailValidation(),
                          errorText: controller.emailError.value,
                        ),

                        SizedBox(height: 15),

                        CommonTextField(
                          showInfoIcon: true,
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
                          fieldTitle: AppStrings.password.tr,
                          controller: controller.passwordController,
                          onChanged: (value) => controller.passwordValidation(),
                          errorText: controller.passwordError.value,
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("Forget password");
                            },
                            child: Container(
                              height: 35,
                              color: AppColors.transparent,
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                AppStrings.forgetPassword.tr,
                                style: Get.textTheme.labelMedium?.copyWith(
                                  fontSize: 16,
                                  color: AppColors.themeColor,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),


                RichText(
                  text: TextSpan(
                    text: AppStrings.donTHaveAnAccount.tr,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.color333333,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.createAccount.tr,
                        style: Get.textTheme.labelMedium?.copyWith(
                          fontSize: 16,
                          color: AppColors.themeColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                CommonButton(
                  title: AppStrings.login.tr,
                  onTapButton: () async {},
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
