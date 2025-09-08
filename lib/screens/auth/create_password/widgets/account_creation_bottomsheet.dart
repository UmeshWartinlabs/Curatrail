import 'dart:async';
import 'dart:ui';
import 'package:curatrail/screens/auth/create_password/widgets/touch_and_face_id_bottomsheet.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountCreationBottomSheet extends StatefulWidget {

  const AccountCreationBottomSheet({super.key});

  @override
  State<AccountCreationBottomSheet> createState() => _AccountCreationBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      backgroundColor: AppColors.transparent,
      builder: (context) => AccountCreationBottomSheet(),
    );
  }
}

class _AccountCreationBottomSheetState extends State<AccountCreationBottomSheet> {
  @override
  void initState() {
    super.initState();
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
                  SvgPicture.asset(AppAssets.accountCreationIcon),
                  SizedBox(height: 30),
                  Text(
                    AppStrings.accountCreationSuccessful.tr,
                    style: Get.textTheme.labelMedium?.copyWith(
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    AppStrings.welcomeBackYouAreSignedIn.tr,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.textLightColor,
                    ),
                  ),

                  SizedBox(height: 30),

                  CommonButton(
                    buttonColor: AppColors.color5FAC50,
                    title: AppStrings.next.tr,
                    onTapButton: () async {
                      Get.back();
                      await TouchAndFaceIdBottomSheet.show(context);
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
