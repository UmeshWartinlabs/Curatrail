import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  static BottomBarController get to => Get.find();

  Rx<int> selectedIndex = 0.obs;

  List<Widget> screens = [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  List<String> pageTitle = [
    AppStrings.dashboard.tr,
    AppStrings.cbt.tr,
    AppStrings.aiCoaching.tr,
    AppStrings.rewards.tr,
  ];

}