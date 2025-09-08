import 'package:curatrail/screens/auth/add_personal_info/controller/add_personal_info_screen_controller.dart';
import 'package:curatrail/screens/auth/add_personal_info/widgets/drop_down_field.dart';
import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddPersonalInfoScreen extends GetView<AddPersonalInfoScreenController> {
  const AddPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(isHideBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${AppStrings.heyWelcome.tr} Anish, ",
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),

                  SvgPicture.asset(AppAssets.wavingHandIcon),
                ],
              ),

              SizedBox(height: 4),

              Text(
                AppStrings.completeYourProfileForBetterService.tr,
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                  
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 15),
                        itemBuilder: (context, index) {
                          return Obx(() => DropDownField(
                            fieldTitle: controller.allFieldValue[index]["field_title"],
                            type: controller.allFieldValue[index]["type"],
                            fieldHint:  controller.allFieldValue[index]["field_hint"],
                            isDropDownOpen: controller.isDropDownOpen[index],
                            selectedValue: controller.dropDownController[index].text,
                            controller: controller.dropDownController[index],
                            maxLine: 2,
                            onSelect: (val) {
                              controller.isDropDownOpen[index] = false;
                              controller.dropDownController[index].text = val;
                            },
                            onTapDropDown: () {
                              controller.isDropDownOpen[index] = !controller.isDropDownOpen[index];
                            },
                            dropDownValue: (controller.allFieldValue[index]["drop_down_value"] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
                          ));
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: controller.allFieldValue.length,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              CommonButton(
                title: AppStrings.submit.tr,
                onTapButton: () {
                  for (int i = 0; i < controller.allFieldValue.length; i++) {
                    String fieldTitle = controller.allFieldValue[i]["field_title"];
                    String selectedValue = controller.dropDownController[i].text;

                    debugPrint("Index $i → $fieldTitle : $selectedValue");
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
