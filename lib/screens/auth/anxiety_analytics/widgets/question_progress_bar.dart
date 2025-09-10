import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionProgressBar extends StatelessWidget {
  final int totalQuestions;
  final int answeredQuestions;

  const QuestionProgressBar({super.key, required this.totalQuestions, required this.answeredQuestions});

  @override
  Widget build(BuildContext context) {
    double progress = answeredQuestions / totalQuestions;

    return Column(
      spacing: 10,
      children: [
        Text(
          "${AppStrings.questions.tr} $answeredQuestions/$totalQuestions",
          style: Get.textTheme.titleMedium,
        ),

        /// Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: AppColors.colorD9D9D9,
            borderRadius: BorderRadius.circular(20),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeColor),
          ),
        ),
      ],
    );
  }
}
