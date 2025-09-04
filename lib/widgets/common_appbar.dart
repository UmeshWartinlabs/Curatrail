import 'package:curatrail/utils/app_assets.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isHideBackButton, isCuratrailTitle;
  final Widget? leadingIcon, actionWidget;
  final void Function()? onTapLeading;
  final TextStyle? titleTextStyle;

  const CommonAppBar({
    super.key,
    this.title,
    this.isHideBackButton,
    this.isCuratrailTitle,
    this.leadingIcon,
    this.onTapLeading,
    this.titleTextStyle, this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        title: (title ?? "").isEmpty
            ? SvgPicture.asset(AppAssets.curatrailText)
            : Text(
                title ?? "",
                style: titleTextStyle ?? Get.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
        leading: (!(isHideBackButton ?? false))
            ? GestureDetector(
                onTap: onTapLeading ?? () {
                  Get.back();
                },
                child: leadingIcon ?? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(AppAssets.backIcon),
                ),
              )
            : null,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              actionWidget ?? const SizedBox(),
            ],
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
