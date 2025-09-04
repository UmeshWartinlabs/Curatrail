import 'package:curatrail/screens/onboarding/controller/onboarding_screen_controller.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() => CommonAppBar(
          isHideBackButton: (controller.currentPageIndex.value == 0),
          onTapLeading: () {
            final currentPage = controller.pageController.page?.round() ?? 0;
            if (currentPage > 0) {
              controller.pageController.animateToPage(
                currentPage - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          actionWidget: (controller.currentPageIndex.value == 3) ? SizedBox() : TextButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.registrationScreen);
              },
              child: Text(
                AppStrings.skip.tr,
                style: Get.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  color: AppColors.textLightColor,
                ),
              ),
          ),
        )),
      ),
      body: SafeArea(
        child: Obx(
          ()=> Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // Spacer(),

                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      controller.currentPageIndex.value = value;
                      print(controller.currentPageIndex);
                    },
                    controller: controller.pageController,
                    itemCount: controller.onboardImages.length,
                    itemBuilder: (context, index) => Column(
                      children: [

                        Spacer(),

                        SizedBox(
                          height: Get.height * .22,
                          child: Image.asset(controller.onboardImages[index]),
                        ),

                        SizedBox(height: Get.height * .03),

                        Text(
                          controller.onboardingTitle[index],
                          style: Get.textTheme.titleLarge?.copyWith(
                            fontSize: 24,
                          ),
                        ),

                        SizedBox(height: Get.height * .03),

                        Text(
                          controller.onboardingDescription[index],
                          textAlign: TextAlign.center,
                          style: Get.textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                            color: AppColors.textLightColor,
                          ),
                        ),

                        Spacer(),
                      ],
                    ),
                  ),
                ),

                // Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        4,
                        (index) => Container(
                          height: 8,
                          width: 8,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (index == controller.currentPageIndex.value) ? AppColors.themeColor : AppColors.colorD9D9D9,
                          ),
                        ),
                      ),
                    ),

                    CommonButton(
                      width: Get.width / 2.5,
                      title: AppStrings.next.tr,
                      onTapButton: () {
                        final currentPage = controller.pageController.page?.round() ?? 0;

                        if (currentPage < (controller.onboardingDescription.length - 1)) {
                          controller.pageController.animateToPage(
                            currentPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.offAllNamed(AppRoutes.registrationScreen);
                        }
                      },
                    ),

                  ],
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
