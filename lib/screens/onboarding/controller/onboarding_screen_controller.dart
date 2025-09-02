import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  static OnboardingScreenController get to => Get.find();

  RxInt currentPageIndex = 0.obs;

  PageController pageController = PageController();

  List<String> onboardImages = [
    AppAssets.onboardIcon1,
    AppAssets.onboardIcon2,
    AppAssets.onboardIcon3,
    AppAssets.onboardIcon4,
  ];

  List<String> onboardingTitle = [
    AppStrings.yourPersonalDashboard.tr,
    AppStrings.cognitiveBehavioralTherapy.tr,
    AppStrings.chatWithYourAiCoach.tr,
    AppStrings.earnPointsAndAchieveMilestones.tr,
  ];

  List<String> onboardingDescription = [
    AppStrings.onboardingDes1,
    AppStrings.onboardingDes2,
    AppStrings.onboardingDes3,
    AppStrings.onboardingDes4,
  ];
}