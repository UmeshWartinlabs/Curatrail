import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_model.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:get/get.dart';

class AnxietyAnalyticsScreenController extends GetxController {
  static AnxietyAnalyticsScreenController get to => Get.find();

  @override
  void onInit () {
    gadQuestionModels = gadQuestions.map((e) => QuestionAnswerModel.fromMap(e)).toList().obs;
    super.onInit();
  }

  RxList<QuestionAnswerModel>? gadQuestionModels;

  int get answeredCount => gadQuestionModels?.where((q) => q.answer != null).length ?? 0;

  int get totalCount => gadQuestionModels?.length ?? 0;

  bool get allAnswered => answeredCount == totalCount && totalCount > 0;

  List<Map<String, dynamic>> gadQuestions = [
    {
      "question" : AppStrings.gadQue1.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue2.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue3.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue4.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue5.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue6.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.gadQue7.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.gadOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.gadOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.gadOption4.tr,
          "score" : 3,
        },
      ],
    },
  ];

}