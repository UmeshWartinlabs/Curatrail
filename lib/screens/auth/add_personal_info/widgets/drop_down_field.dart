import 'package:curatrail/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownField extends StatefulWidget {
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
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.isDropDownOpen == true) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant DropDownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDropDownOpen == true) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Field Title
        Text(
          widget.fieldTitle ?? "",
          style: Get.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: AppColors.textColor,
          ),
        ),

        SizedBox(height: 6),

        /// Dropdown Field / TextField
        GestureDetector(
          onTap: widget.onTapDropDown,
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.colorF3F3F3,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: (widget.type ?? "") == "dropdown" ? 20 : 5,
              vertical: (widget.type ?? "") == "dropdown" ? 14 : 0,
            ),
            child: (widget.type ?? "") == "dropdown"
                ? Row(
                    children: [
                      Text(
                        (widget.selectedValue ?? "").isEmpty
                            ? (widget.fieldHint ?? "")
                            : (widget.selectedValue ?? ""),
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          color: (widget.selectedValue ?? "").isEmpty
                              ? AppColors.textLightColor
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
                    maxLines: widget.maxLine,
                    controller: widget.controller,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.fieldHint,
                      hintStyle: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.textLightColor,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
          ),
        ),

        /// Animated Dropdown List
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: 0.0,
          child: Column(
            children: widget.dropDownValue.asMap().entries.map((entry) {
              final index = entry.key;
              final value = entry.value;
              final isLast = index == widget.dropDownValue.length - 1;

              return InkWell(
                onTap: () => widget.onSelect?.call(value),
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        ),
      ],
    );
  }
}
