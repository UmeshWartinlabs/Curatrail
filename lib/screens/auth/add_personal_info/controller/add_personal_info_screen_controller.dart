import 'package:curatrail/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPersonalInfoScreenController extends GetxController {
  static AddPersonalInfoScreenController get to => Get.find();

  RxList<bool> isDropDownOpen = <bool>[].obs;

  RxList<TextEditingController> dropDownController = <TextEditingController>[].obs;

  @override
  void onInit() {

    isDropDownOpen.value = List.generate(allFieldValue.length, (index) => false);
    dropDownController.value = List.generate(allFieldValue.length, (index) => TextEditingController());

    super.onInit();
  }

  List<Map<String, dynamic>> allFieldValue = [
    {
      "field_title" : AppStrings.gender,
      "field_hint" : AppStrings.selectGender,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.male.tr,
        AppStrings.female.tr,
        AppStrings.nonBinary.tr,
        AppStrings.selfDescribe.tr,
      ],
    },
    {
      "field_title" : AppStrings.race.tr,
      "field_hint" : AppStrings.selectRace,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.asian.tr,
        AppStrings.blackAfricanDescent.tr,
        AppStrings.hispanicLatino.tr,
        AppStrings.middleEasternNorthAfrican.tr,
        AppStrings.nativeAmericanIndigenous.tr,
        AppStrings.pacificIslander.tr,
        AppStrings.whiteCaucasian.tr,
        AppStrings.mixedMultiracial.tr,
        AppStrings.other.tr,
        AppStrings.preferNotToSay.tr,
      ],
    },
    {
      "field_title" : AppStrings.educationLevel.tr,
      "field_hint" : AppStrings.selectEducationLevel.tr,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.noFormalEducation.tr,
        AppStrings.primarySchool.tr,
        AppStrings.secondarySchoolHighSchoolDiploma.tr,
        AppStrings.someCollegeNoDegree.tr,
        AppStrings.associateDegree.tr,
        AppStrings.bachelorsDegree.tr,
        AppStrings.mastersDegree.tr,
        AppStrings.doctorateProfessionalDegree.tr,
        AppStrings.preferNotToSay.tr,
      ],
    },
    {
      "field_title" : AppStrings.maritalStatus.tr,
      "field_hint" : AppStrings.selectMaritalStatus.tr,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.single.tr,
        AppStrings.married.tr,
        AppStrings.livingWithPartner.tr,
        AppStrings.divorced.tr,
        AppStrings.widowed.tr,
        AppStrings.separated.tr,
        AppStrings.preferNotToSay.tr,
      ],
    },
    {
      "field_title" : AppStrings.occupation.tr,
      "field_hint" : AppStrings.selectOccupation.tr,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.student.tr,
        AppStrings.employedFullTime.tr,
        AppStrings.employedPartTime.tr,
        AppStrings.selfEmployed.tr,
        AppStrings.unemployed.tr,
        AppStrings.homemaker.tr,
        AppStrings.retired.tr,
        AppStrings.unableToWork.tr,
        AppStrings.preferNotToSay.tr,
      ],
    },
    {
      "field_title" : AppStrings.socialEconomicStatus.tr,
      "field_hint" : AppStrings.selectEconomicStatus.tr,
      "type" : "dropdown",
      "drop_down_value" : <String>[
        AppStrings.facingFinancialDifficulties.tr,
        AppStrings.ableToMeetBasic.tr,
        AppStrings.comfortableNoMajorFinancialStress.tr,
        AppStrings.wellOffAbleToAffordMostThing.tr,
        AppStrings.wealthNoFinancialConstraints.tr,
        AppStrings.preferNotToSay.tr,
      ],
    },
    {
      "field_title" : AppStrings.location.tr,
      "field_hint" : AppStrings.enterYourLocation.tr,
      "type" : "textfield",
    }
  ];

}