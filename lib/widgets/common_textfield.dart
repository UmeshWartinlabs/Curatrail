import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/widgets/common_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? hintMaxLines;
  final String? fieldTitle;
  final bool? isFieldRequired, enable, readOnly, showInfoIcon, obscureText;
  final int? maxLine;
  final ValueChanged<String>? onChanged;
  final Color? borderColor;
  final double? borderRadius;
  final String? hintText;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap, onTapInfo;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool isEmailField;
  final String? errorText;
  final TextInputType? keyboardType;

  const CommonTextField({
    super.key,
    this.controller,
    this.hintMaxLines,
    this.maxLine,
    this.onChanged,
    this.borderColor,
    this.borderRadius,
    this.hintText,
    this.hintStyle,
    this.focusNode,
    this.inputFormatters,
    this.onTap,
    this.onTapOutside,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.contentPadding,
    this.isEmailField = false,
    this.errorText,
    this.keyboardType, this.fieldTitle, this.isFieldRequired, this.enable, this.readOnly, this.showInfoIcon, this.onTapInfo, this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: fieldTitle ?? "",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.color333333,
                ),
                children: [
                  TextSpan(
                    text: (isFieldRequired ?? true) ?  " *" : "",
                    style: TextStyle(
                      color: AppColors.colorF91D0A,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            (showInfoIcon ?? false)
                ? GestureDetector(
                    onTap: onTapInfo,
                    child: SvgPicture.asset(AppAssets.infoIcon),
                  )
                : SizedBox(),
          ],
        ),

        SizedBox(height: 5),

        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            color: AppColors.colorF3F3F3,
          ),
          child: TextFormField(
            readOnly: readOnly ?? false,
            enabled: enable ?? true,
            focusNode: focusNode,
            onTapOutside: onTapOutside ?? (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            obscureText: obscureText ?? false,
            onTap: onTap,
            maxLines: maxLine ?? 1,
            onChanged: onChanged,
            controller: controller,
            cursorColor: AppColors.themeColor,
            cursorHeight: 20,
            keyboardType: keyboardType ?? TextInputType.text,
            inputFormatters: inputFormatters ?? [],
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 20,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? "".tr,
              contentPadding: contentPadding ?? EdgeInsets.only(
                left: 15,
                top: 12,
                bottom: (obscureText ?? false) ? 12 : 0,
                right: 12,
              ),
              hintMaxLines: hintMaxLines ?? 5,
              hintStyle: hintStyle ?? Get.textTheme.titleLarge?.copyWith(
                color: AppColors.textLightColor,
                fontSize: 15,
              ),
              errorStyle: Get.textTheme.titleLarge?.copyWith(
                color: AppColors.textLightColor,
                fontSize: 15,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor ?? AppColors.themeColor,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          commonErrorMessage(errorText: errorText!.tr),
      ],
    );
  }
}
