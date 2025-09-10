import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_model.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionAnswerView extends GetView<AnxietyAnalyticsScreenController> {
  final List<QuestionAnswerModel> allQuestionsAndAnswer;
  final void Function({required int questionIndex, required int optionIndex, required OptionModel answer})? onTapAnswer;

  const QuestionAnswerView({super.key, required this.allQuestionsAndAnswer, this.onTapAnswer});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
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
                          color: (allQuestionsAndAnswer[index].answer?.text == allQuestionsAndAnswer[index].options?[ind].text) ? AppColors.themeColor : AppColors.white,
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
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: allQuestionsAndAnswer.length,
      ),
    );
  }
}
