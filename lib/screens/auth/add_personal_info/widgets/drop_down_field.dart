import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownField extends StatelessWidget {
  final String? fieldTitle;
  final String? fieldHint;
  final bool? isDropDownOpen;
  final List<String> dropDownValue;
  final String? selectedValue;
  final String? type;
  final int? maxLine;
  final Function(String)? onSelect;
  final TextEditingController? controller;
  final void Function()? onTapDropDown;

  const DropDownField({
    super.key,
    this.fieldTitle,
    this.fieldHint,
    this.isDropDownOpen,
    required this.dropDownValue,
    this.onSelect,
    this.onTapDropDown,
    this.selectedValue,
    this.type,
    this.maxLine,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle ?? "",
          style: Get.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: AppColors.textColor,
          ),
        ),

        SizedBox(height: 6),

        GestureDetector(
          onTap: onTapDropDown,
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.colorF3F3F3,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: (type ?? "") == "dropdown" ? 20 : 5,
              vertical: (type ?? "") == "dropdown" ? 14 : 0,
            ),
            child: (type ?? "") == "dropdown"
                ? Row(
                    children: [
                      Text(
                        (selectedValue ?? "").isEmpty
                            ? (fieldHint ?? "")
                            : (selectedValue ?? ""),
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          color: (selectedValue ?? "").isEmpty
                              ? AppColors.textColor
                              : AppColors.black,
                        ),
                      ),

                      Spacer(),

                      Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.colorDADADA,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 17,
                        ),
                      ),
                    ],
                  )
                : TextFormField(
                    maxLines: maxLine,
                    controller: controller,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: fieldHint,
                      hintStyle: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
          ),
        ),

        if (isDropDownOpen == true) ...[
          Column(
            children: dropDownValue.asMap().entries.map((entry) {
              final index = entry.key;
              final value = entry.value;
              final isLast = index == dropDownValue.length - 1;

              return InkWell(
                onTap: () => onSelect?.call(value),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.colorF3F3F3,
                    border: isLast
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: AppColors.colorDADADA,
                              width: 0.5,
                            ),
                          ),
                  ),
                  child: Text(
                    value,
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      color: AppColors.textLightColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
