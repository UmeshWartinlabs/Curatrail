import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/progress_bar.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_view.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_progress_bar.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
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
                AnxietyProgressBar(
                  isGadQuestionComplete: controller.isGadQuestionComplete.value,
                  isBaiQuestionComplete: controller.isBaiQuestionComplete.value,
                ),

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
                  allQuestionsAndAnswer: controller.isGadQuestionComplete.value ? controller.baiQuestionModels ?? [] : controller.gadQuestionModels ?? [],
                  onTapAnswer: ({required answer, required optionIndex, required questionIndex}) {
                        if (controller.isGadQuestionComplete.value) {
                          controller.baiQuestionModels?[questionIndex].answer = answer;
                          debugPrint(controller.baiQuestionModels?[questionIndex].answer?.text);
                          controller.baiQuestionModels?.refresh();
                        } else {
                          controller.gadQuestionModels?[questionIndex].answer = answer;
                          debugPrint(controller.gadQuestionModels?[questionIndex].answer?.text);
                          controller.gadQuestionModels?.refresh();
                        }
                      },
                ),

                CommonButton(
                  buttonColor: (() {
                    final isGadFlow = !controller.isGadQuestionComplete.value;
                    final questions = isGadFlow ? controller.gadQuestionModels : controller.baiQuestionModels;
                    final isLastIndex = controller.currentQuestionIndex.value == (questions?.length ?? 0) - 1;
                    final hasAnswered = (questions?[controller.currentQuestionIndex.value].answer != null);
                    final isScoreView = controller.isScoreView.value;

                    if (isLastIndex && (isScoreView || hasAnswered)) {
                      return AppColors.themeColor;
                    }
                    return AppColors.colorC1C1C1;
                  })(),

                  title: (() {
                    final isGadFlow = !controller.isGadQuestionComplete.value;
                    final questions = isGadFlow ? controller.gadQuestionModels : controller.baiQuestionModels;
                    final isLastIndex = controller.currentQuestionIndex.value == (questions?.length ?? 0) - 1;
                    final hasAnswered = (questions?[controller.currentQuestionIndex.value].answer != null);
                    final isScoreView = controller.isScoreView.value;

                    if (isLastIndex && isScoreView) {
                      return isGadFlow ? AppStrings.next : AppStrings.goToDashboard;
                    }
                    if (isLastIndex && hasAnswered) {
                      return AppStrings.submit;
                    }
                    if (!isLastIndex) {
                      return AppStrings.previous;
                    }
                    return "";
                  })(),

                  onTapButton: () {
                    final isGadFlow = !controller.isGadQuestionComplete.value;
                    final questions = isGadFlow ? controller.gadQuestionModels : controller.baiQuestionModels;
                    final isLastIndex = controller.currentQuestionIndex.value == (questions?.length ?? 0) - 1;
                    final hasAnswered = (questions?[controller.currentQuestionIndex.value].answer != null);
                    final isScoreView = controller.isScoreView.value;

                    if (!isLastIndex) {
                      /// when not last question so go back to previous question
                      if (controller.currentQuestionIndex.value > 0) {
                        controller.gadQuestionPageController.animateToPage(
                          controller.currentQuestionIndex.value - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                        );
                      }
                      return;
                    }

                    /// when all gad or bai questions ans fill and score view is open
                    if (isScoreView) {
                      if (isGadFlow) {

                        /// functionality for complete gad and start bai questions
                        controller.isGadQuestionComplete.value = true;
                        controller.currentQuestionIndex.value = 0;
                        controller.isScoreView.value = false;
                        controller.gadQuestionPageController.jumpTo(0);
                        debugPrint("➡ Moving to BAI questions");
                      } else {

                        /// functionality for after complete bai question and redirecting to the dashboard
                        debugPrint("➡ Both GAD & BAI complete → Navigate to Dashboard");
                        Get.offAllNamed(AppRoutes.bottomBarScreen);
                      }
                      return;
                    }

                    if (hasAnswered) {

                      /// Functionality for calculate total score
                      final totalScore = questions?.where((q) => q.answer != null).fold<int>(0, (sum, q) => sum + (q.answer?.score ?? 0),) ?? 0;

                      if (isGadFlow) {
                        /// for store total score of gad
                        controller.totalScoreForGadQuestion.value = totalScore;
                        controller.isScoreView.value = true;
                        debugPrint("➡ GAD Score: ${controller.totalScoreForGadQuestion.value}");
                      } else {
                        /// for store total score of bai
                        controller.totalScoreForBaiQuestion.value = totalScore;
                        controller.isScoreView.value = true;
                        controller.isBaiQuestionComplete.value = true;
                        debugPrint("➡ BAI Score: ${controller.totalScoreForBaiQuestion.value}");
                      }
                    } else {
                      /// for go back to previous question
                      if (controller.currentQuestionIndex.value > 0) {
                        controller.gadQuestionPageController.animateToPage(
                          controller.currentQuestionIndex.value - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                        );
                      }
                    }
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
