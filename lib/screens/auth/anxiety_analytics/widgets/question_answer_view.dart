import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_model.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionAnswerView extends GetView<AnxietyAnalyticsScreenController> {
  final List<QuestionAnswerModel> allQuestionsAndAnswer;
  final void Function({required int questionIndex, required int optionIndex, required OptionModel answer})? onTapAnswer;

  const QuestionAnswerView({super.key, required this.allQuestionsAndAnswer, this.onTapAnswer});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.isScoreView.value
          ? Container(
              color: AppColors.white,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 100,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorF5FAFF,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        AppStrings.scoring.tr,
                        style: Get.textTheme.titleLarge?.copyWith(
                          color: AppColors.color098DBE,
                          fontSize: 16,
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Your score: ",
                              style: Get.textTheme.titleMedium?.copyWith(
                                color: AppColors.black,
                                fontSize: 16,
                              ),
                            ),

                            TextSpan(
                              text: controller.isGadQuestionComplete.value
                                  ? controller.totalScoreForBaiQuestion.value.toString()
                                  : controller.totalScoreForGadQuestion.value.toString(),
                              style: Get.textTheme.labelMedium?.copyWith(
                                color: AppColors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        controller.getAnxietyType(
                          isGad: !controller.isGadQuestionComplete.value,
                          score: controller.isGadQuestionComplete.value
                              ? controller.totalScoreForBaiQuestion.value
                              : controller.totalScoreForGadQuestion.value,
                        ),
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 14,
                        ),
                      ),

                      Spacer(),
                    ],
                  ),
                ),
              ),
            )
          : PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.gadQuestionPageController,
              onPageChanged: (value) {
                controller.currentQuestionIndex.value = value;
                debugPrint(controller.currentQuestionIndex.value.toString());
              },
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q.${index + 1}  ",
                        style: Get.textTheme.titleLarge?.copyWith(
                          color: AppColors.black,
                          fontSize: 16,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          allQuestionsAndAnswer[index].question ?? "",
                          style: Get.textTheme.titleLarge?.copyWith(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, ind) => GestureDetector(
                      onTap: () {
                        if (onTapAnswer != null) {
                          OptionModel selectedAns = OptionModel(
                            text: allQuestionsAndAnswer[index].options?[ind].text ?? "",
                            score: allQuestionsAndAnswer[index].options?[ind].score ?? 0,
                          );
                          onTapAnswer!(
                            questionIndex: index,
                            optionIndex: ind,
                            answer: selectedAns,
                          );

                          final lastIndex = (allQuestionsAndAnswer.length) - 1;

                          if (controller.currentQuestionIndex.value < lastIndex) {
                            controller.gadQuestionPageController.animateToPage(
                              controller.currentQuestionIndex.value + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.bounceInOut,
                            );
                          } else {
                            debugPrint("✅ Reached the last question, no more next pages.");
                          }
                        }
                      },
                      child: Container(
                        color: AppColors.transparent,
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.themeColor),
                                shape: BoxShape.circle,
                                color: (allQuestionsAndAnswer[index].answer?.text == allQuestionsAndAnswer[index].options?[ind].text)
                                    ? AppColors.themeColor
                                    : AppColors.white,
                              ),
                            ),

                            Expanded(
                              child: Text(
                                allQuestionsAndAnswer[index].options?[ind].text ?? "",
                                style: Get.textTheme.titleLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 15),
                    itemCount: (allQuestionsAndAnswer[index].options ?? []).length,
                  ),
                ],
              ),
              itemCount: allQuestionsAndAnswer.length,
      ),
    );
  }
}
