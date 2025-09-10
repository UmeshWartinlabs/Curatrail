import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnxietyProgressBar extends GetView<AnxietyAnalyticsScreenController> {
  final bool? isGadComplete;
  final bool? isBaiComplete;
  const AnxietyProgressBar({super.key, this.isGadComplete, this.isBaiComplete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppStrings.gad7.tr,
              style: Get.textTheme.titleMedium?.copyWith(
                color: AppColors.themeColor,
                fontSize: 16,
              ),
            ),

            Text(
              AppStrings.bai.tr,
              style: Get.textTheme.titleMedium?.copyWith(
                color: AppColors.textLightColor,
                fontSize: 16,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        Row(
          children: [

            Stack(
              children: [
                SizedBox(
                  height: 20,
                    child: Center(
                    child: Container(
                      height: 5,
                      width: Get.width - 40,
                      decoration: BoxDecoration(
                        color: AppColors.colorE1E1E1,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 5,
                            width: (Get.width - 40) / 2,
                            color: (isGadComplete ?? false) ? AppColors.color5FAC50 : AppColors.themeColor,
                          ),

                          Container(
                            height: 5,
                            width: (Get.width - 40) / 2,
                            color: (isGadComplete ?? false) ? (isBaiComplete ?? false) ? AppColors.color5FAC50 : AppColors.themeColor : AppColors.colorE1E1E1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: (Get.width - 80 ) / 4,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: (isGadComplete ?? false) ? AppColors.color5FAC50 : AppColors.themeColor),
                      color: (isGadComplete ?? false) ? AppColors.color5FAC50 : AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Positioned(
                  right: (Get.width - 80 ) / 4,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: (isGadComplete ?? false) ? (isBaiComplete ?? false) ? AppColors.color5FAC50 : AppColors.themeColor : AppColors.colorD9D9D9),
                      color: (isBaiComplete ?? false) ? AppColors.color5FAC50 : AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            )


          ],
        ),
      ],
    );
  }
}
