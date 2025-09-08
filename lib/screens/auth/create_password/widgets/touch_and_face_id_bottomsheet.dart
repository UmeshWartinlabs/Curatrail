import 'dart:async';
import 'dart:ui';
import 'package:curatrail/screens/auth/create_password/controller/create_password_controller.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TouchAndFaceIdBottomSheet extends StatefulWidget {

  const TouchAndFaceIdBottomSheet({super.key});

  @override
  State<TouchAndFaceIdBottomSheet> createState() => _TouchAndFaceIdBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      backgroundColor: AppColors.transparent,
      builder: (context) => TouchAndFaceIdBottomSheet(),
    );
  }
}

class _TouchAndFaceIdBottomSheetState extends State<TouchAndFaceIdBottomSheet> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),

                  Center(
                    child: Container(
                      height: 5,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorB7B7B7,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      CreatePasswordController.to.isFingerLockEnable.value = true;
                      setState(() {});
                    },
                    child: Container(
                      color: AppColors.transparent,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.themeColor),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CreatePasswordController.to.isFingerLockEnable.value ? AppColors.themeColor : AppColors.white,
                                  ),
                                ),
                              ),

                              SvgPicture.asset(AppAssets.fingerprintIcon),

                              SizedBox(height: 25, width: 25),

                            ],
                          ),

                          SizedBox(height: 30),
                          Text(
                            AppStrings.enablingTouchID.tr,
                            style: Get.textTheme.labelMedium?.copyWith(
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 10),

                          Text(
                            AppStrings.youCanTurnOffThisInSetting.tr,
                            style: Get.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              color: AppColors.textLightColor,
                            ),
                          ),

                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),



                  GestureDetector(
                    onTap: () {
                      CreatePasswordController.to.isFingerLockEnable.value = false;
                      setState(() {});
                    },
                    child: Container(
                      color: AppColors.transparent,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.themeColor),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CreatePasswordController.to.isFingerLockEnable.value ? AppColors.white : AppColors.themeColor,
                                  ),
                                ),
                              ),

                              SvgPicture.asset(AppAssets.faceIdIcon),

                              SizedBox(height: 25, width: 25),

                            ],
                          ),

                          SizedBox(height: 30),
                          Text(
                            AppStrings.enablingFaceID.tr,
                            style: Get.textTheme.labelMedium?.copyWith(
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 10),

                          Text(
                            AppStrings.youCanTurnOffThisInSetting.tr,
                            style: Get.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              color: AppColors.textLightColor,
                            ),
                          ),

                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),


                  CommonButton(
                    title: AppStrings.enable.tr,
                    onTapButton: () {
                      Get.back();
                    },
                  ),

                  SizedBox(height: 10),

                  CommonButton(
                    title: AppStrings.notNow.tr,
                    buttonColor: AppColors.colorDADADA,
                    onTapButton: () {
                      Get.back();
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
