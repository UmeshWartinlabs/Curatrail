import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final double? width, radius;
  final Color? buttonColor;
  final String? title;
  final void Function()? onTapButton;
  const CommonButton({super.key, this.width, this.radius, this.buttonColor, this.title, this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        height: 53,
        width: width ?? Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 16),
          color: buttonColor ?? AppColors.themeColor,
        ),
        child: Text(
          title ?? "",
          style: Get.textTheme.labelMedium?.copyWith(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
