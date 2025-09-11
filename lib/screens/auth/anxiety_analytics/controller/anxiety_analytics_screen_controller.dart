import 'package:curatrail/screens/auth/anxiety_analytics/widgets/question_answer_model.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnxietyAnalyticsScreenController extends GetxController {
  static AnxietyAnalyticsScreenController get to => Get.find();

  @override
  void onInit () {
    gadQuestionModels = gadQuestions.map((e) => QuestionAnswerModel.fromMap(e)).toList().obs;
    baiQuestionModels = baiQuestions.map((e) => QuestionAnswerModel.fromMap(e)).toList().obs;
    super.onInit();
  }

  PageController gadQuestionPageController = PageController();

  RxInt currentQuestionIndex = 0.obs;

  RxBool isGadQuestionComplete = false.obs;
  RxBool isBaiQuestionComplete = false.obs;

  RxBool isScoreView = false.obs;

  RxInt totalScoreForGadQuestion = 0.obs;
  RxInt totalScoreForBaiQuestion = 0.obs;

  RxList<QuestionAnswerModel>? gadQuestionModels;
  RxList<QuestionAnswerModel>? baiQuestionModels;

  int get answeredCount => isGadQuestionComplete.value ? baiQuestionModels?.where((a) => a.answer != null).length ?? 0 : gadQuestionModels?.where((q) => q.answer != null).length ?? 0;

  int get totalCount => isGadQuestionComplete.value ? baiQuestionModels?.length ?? 0 : gadQuestionModels?.length ?? 0;

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


  List<Map<String, dynamic>> baiQuestions = [
    {
      "question" : AppStrings.baiQue1.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue2.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue3.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue4.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue5.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue6.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue7.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue8.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue9.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue10.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue11.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue12.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue13.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue14.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue15.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue16.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue17.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue18.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue19.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue20.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
    {
      "question" : AppStrings.baiQue21.tr,
      "options" : [
        {
          "text" : AppStrings.gadOption1.tr,
          "score" : 0,
        },
        {
          "text" : AppStrings.baiOption2.tr,
          "score" : 1,
        },
        {
          "text" : AppStrings.baiOption3.tr,
          "score" : 2,
        },
        {
          "text" : AppStrings.baiOption4.tr,
          "score" : 3,
        },
      ],
    },
  ];

  String getAnxietyType({required bool isGad, required int score}) {
    if (isGad) {
      // GAD scoring
      if (score <= 4) return "Minimal anxiety";
      if (score <= 9) return "Mild anxiety";
      if (score <= 14) return "Moderate anxiety";
      return "Severe anxiety";
    } else {
      // BAI scoring
      if (score <= 21) return "Low anxiety";
      if (score <= 35) return "Moderate anxiety";
      return "Potentially concerning levels of anxiety";
    }
  }


}