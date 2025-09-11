import 'package:curatrail/screens/bottom_bar/controller/bottom_bar_controller.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarScreen extends GetView<BottomBarController> {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(image: AppAssets.dashboardIcon, index: 0),
                _buildNavItem(image: AppAssets.cbtIcon, index: 1),
                _buildNavItem(image: AppAssets.aiCoachingIcon, index: 2),
                _buildNavItem(image: AppAssets.rewardIcon, index: 3),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem({required String image, required int index}) {
    bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.themeColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 25,
              color: isSelected ? AppColors.white : AppColors.themeColor.withOpacity(0.60),
            ),

            if (isSelected) SizedBox(width: 10),

            if (isSelected)
              Text(
                controller.pageTitle[index],
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
