import 'dart:async';
import 'dart:ui';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OtpSentToEmailBottomSheet extends StatefulWidget {

  const OtpSentToEmailBottomSheet({super.key});

  @override
  State<OtpSentToEmailBottomSheet> createState() => _OtpSentToEmailBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      backgroundColor: AppColors.transparent,
      builder: (context) => OtpSentToEmailBottomSheet(),
    );
  }
}

class _OtpSentToEmailBottomSheetState extends State<OtpSentToEmailBottomSheet> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: PopScope(
        canPop: false,
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 5,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorB7B7B7,
                    ),
                  ),
                  SizedBox(height: 30),
                  SvgPicture.asset(AppAssets.emailVerificationIcon),
                  SizedBox(height: 20),
                  Text(
                    AppStrings.digitCodeSentToYourEmail.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.labelMedium?.copyWith(
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    AppStrings.pleaseEnterThatCodeToResetPassword.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.textLightColor,
                    ),
                  ),

                  SizedBox(height: 20),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppStrings.notReceivedYet.tr,
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.resendEmail,
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            color: AppColors.themeColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint("Tap resend");
                            },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  CommonButton(
                    title: AppStrings.verify.tr,
                    onTapButton: () {
                      Get.back();
                      Get.toNamed(AppRoutes.forgotPasswordOtpScreen);
                    },
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
