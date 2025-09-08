import 'dart:io';
import 'package:curatrail/screens/auth/forgot_password_otp/controller/forgot_password_otp_controller.dart';
import 'package:curatrail/screens/auth/forgot_password_otp/widgets/otp_verified_bottomsheet.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_error_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordOtpScreen extends GetView<ForgotPasswordOtpController> {
  const ForgotPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(isTitleWithLogo: true),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          AppStrings.enter6DigitCode.tr,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            color: AppColors.textLightColor,
                          ),
                        ),

                        SizedBox(height: 40),

                        Pinput(
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          onChanged: (value) {
                            controller.otpController.text = value;
                            controller.otpValidation();
                          },
                          keyboardType: TextInputType.number,
                          onCompleted: (value) {
                            controller.otpController.text = value;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          defaultPinTheme: PinTheme(
                            height: 55,
                            textStyle: Get.textTheme.labelMedium?.copyWith(
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F3F3,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),

                        SizedBox(height: 4),

                        controller.otpError.value.isNotEmpty
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: commonErrorMessage(
                                  errorText: controller.otpError.value,
                                ),
                              )
                            : SizedBox(),

                        controller.seconds.value == 0
                            ? SizedBox()
                            : Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "00 : ${controller.seconds.value.toString().padLeft(2, '0')} s",
                                  style: Get.textTheme.titleMedium?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.color1E1E1E,
                                  ),
                                ),
                              ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.didTReceiveCode.tr,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.resendCode,
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          color: controller.seconds.value == 0
                              ? AppColors.themeColor
                              : AppColors.themeColor.withOpacity(0.5),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (controller.seconds.value == 0) {
                              controller.startTimer();
                            }
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                CommonButton(
                  title: AppStrings.verify.tr,
                  onTapButton: () async {
                    if (await controller.validator()) {
                      await OtpVerifiedBottomSheet.show(context);
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
