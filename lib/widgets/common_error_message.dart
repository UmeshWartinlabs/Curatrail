import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonErrorMessage({required String errorText}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Text(
      errorText,
      style: Get.textTheme.titleMedium?.copyWith(
        fontSize: 12,
        color: AppColors.colorF91D0A,
      ),
    ),
  );
}
