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

class OtpVerifiedBottomSheet extends StatefulWidget {
  final String? title;
  final String? buttonText;
  const OtpVerifiedBottomSheet({super.key, this.title, this.buttonText});

  @override
  State<OtpVerifiedBottomSheet> createState() => _OtpVerifiedBottomSheetState();

  static Future show(BuildContext context, {String? title, String? buttonText}) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      backgroundColor: AppColors.transparent,
      builder: (context) => OtpVerifiedBottomSheet(title: title, buttonText: buttonText,),
    );
  }
}

class _OtpVerifiedBottomSheetState extends State<OtpVerifiedBottomSheet> {
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

                  SvgPicture.asset(AppAssets.otpVerificationIcon),

                  SizedBox(height: 30),

                  Text(
                    widget.title ?? AppStrings.otpVerifiedSuccessfully.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.labelMedium?.copyWith(
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(height: 35),

                  CommonButton(
                    title: widget.buttonText ?? AppStrings.next.tr,
                    buttonColor: AppColors.color5FAC50,
                    onTapButton: () {
                      Get.back();
                      if((widget.buttonText ?? "").isEmpty) {
                        Get.offNamed(AppRoutes.resetPasswordScreen);
                      } else {
                        Get.offAllNamed(AppRoutes.loginScreen);
                      }
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
