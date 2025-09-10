import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/progress_bar.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_view.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_progress_bar.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnxietyAnalyticsScreen extends GetView<AnxietyAnalyticsScreenController> {
  const AnxietyAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 20,
              children: [

                AnxietyProgressBar(isGadComplete: false, isBaiComplete: false),

                Text(
                  AppStrings.pleaseCompleteTheGad7.tr,
                  style: Get.textTheme.titleMedium?.copyWith(
                    color: AppColors.textColor,
                    fontSize: 14,
                  ),
                ),

                QuestionProgressBar(
                  answeredQuestions: controller.answeredCount,
                  totalQuestions: controller.totalCount,
                ),

                QuestionAnswerView(
                  allQuestionsAndAnswer: controller.gadQuestionModels?.value ?? [],
                  onTapAnswer: ({required answer, required optionIndex, required questionIndex}) {
                    controller.gadQuestionModels?[questionIndex].answer = answer;
                    debugPrint(controller.gadQuestionModels?[questionIndex].answer?.text);
                    controller.gadQuestionModels?.refresh();
                  },
                ),

                CommonButton(
                  onTapButton: () {
                    int totalScore = controller.gadQuestionModels?.where((q) => q.answer != null).fold(0, (sum, q) => sum! + (q.answer?.score ?? 0)) ?? 0;
                    debugPrint(totalScore.toString());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
