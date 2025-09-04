import 'dart:async';
import 'dart:ui';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConfirmYourEmailBottomSheet extends StatefulWidget {
  final String email;

  const ConfirmYourEmailBottomSheet({super.key, required this.email});

  @override
  State<ConfirmYourEmailBottomSheet> createState() => _ConfirmYourEmailBottomSheetState();

  static Future show(BuildContext context, {required String email}) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      backgroundColor: AppColors.transparent,
      builder: (context) => ConfirmYourEmailBottomSheet(email: email),
    );
  }
}

class _ConfirmYourEmailBottomSheetState extends State<ConfirmYourEmailBottomSheet> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
        Get.offAllNamed(
          AppRoutes.createPasswordScreen,
          arguments: widget.email,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
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
                  AppStrings.confirmationYourEmail.tr,
                  style: Get.textTheme.labelMedium?.copyWith(
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.weSentAConfirmationEmail.tr,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      height: 1.3,
                      color: AppColors.textLightColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${widget.email}\n",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          height: 1.3,
                          color: AppColors.themeColor,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.checkYourEmailMessage.tr,
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          height: 1.3,
                          color: AppColors.textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.notReceivedYet.tr,
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      color: AppColors.textLightColor,
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
