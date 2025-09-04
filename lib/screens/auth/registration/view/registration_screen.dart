import 'dart:io';
import 'package:curatrail/screens/auth/registration/controller/registration_controller.dart';
import 'package:curatrail/screens/auth/registration/widgets/confirm_your_email_bottomsheet.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:curatrail/utils/app_strings.dart';
import 'package:curatrail/widgets/common_appbar.dart';
import 'package:curatrail/widgets/common_button.dart';
import 'package:curatrail/widgets/common_textfield.dart';
import 'package:curatrail/widgets/common_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(isHideBackButton: true),
      body: Obx(
        () => SafeArea(
          child: GestureDetector(
            onTap: () {
              controller.isShowToolTip.value = false;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * .07),

                          Center(
                            child: Text(
                              AppStrings.registration.tr,
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontSize: 32,
                                color: AppColors.color333333,
                              ),
                            ),
                          ),

                          SizedBox(height: Get.height * .02),

                          CommonTextField(
                            fieldTitle: AppStrings.email.tr,
                            controller: controller.emailController,
                            onChanged: (value) => controller.emailValidation(),
                            errorText: controller.emailError.value,
                          ),

                          SizedBox(height: 15),

                          CommonTextField(
                            fieldTitle: AppStrings.phoneNO.tr,
                            controller: controller.phoneNumberController,
                            onChanged: (value) =>
                                controller.phoneNumberValidation(),
                            errorText: controller.phoneNumberError.value,
                            keyboardType: TextInputType.phone,
                          ),

                          SizedBox(height: 15),

                          Stack(
                            children: [
                              Column(
                                children: [
                                  CommonTextField(
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await commonDatePicker(
                                            context: context,
                                          );

                                      if (pickedDate != null) {
                                        controller.dateOfBirthController.text =
                                            formatDate(
                                              date: pickedDate,
                                              pattern: "dd/MM/yyyy",
                                            );
                                        debugPrint(
                                          "Selected Date: $pickedDate",
                                        );
                                      }
                                      await controller.dateOfBirthValidation();
                                    },
                                    fieldTitle: AppStrings.dob.tr,
                                    controller:
                                        controller.dateOfBirthController,
                                    onChanged: (value) =>
                                        controller.dateOfBirthValidation(),
                                    errorText:
                                        controller.dateOfBirthError.value,
                                    keyboardType: TextInputType.number,
                                  ),

                                  SizedBox(height: 15),

                                  CommonTextField(
                                    showInfoIcon: true,
                                    onTapInfo: () async {
                                      controller.isShowToolTip.value =
                                          !controller.isShowToolTip.value;
                                    },
                                    fieldTitle: AppStrings.patientAuthCode.tr,
                                    controller:
                                        controller.patientAuthCodeController,
                                    onChanged: (value) =>
                                        controller.patientAuthCodeValidation(),
                                    errorText:
                                        controller.patientAuthCodeError.value,
                                    keyboardType: TextInputType.text,
                                  ),

                                  SizedBox(height: 20),
                                ],
                              ),

                              if (controller.isShowToolTip.value)
                                Positioned(
                                  right: 25,
                                  top: 82,
                                  child: CustomTooltip(
                                    maxWidth: Get.width - 150,
                                    message: AppStrings.infoMessage.tr,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      text: AppStrings.alreadyHaveAnAccount.tr,
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: AppColors.color333333,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.login.tr,
                          style: Get.textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.themeColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Tap login");
                              Get.toNamed(AppRoutes.loginScreen);
                            },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  CommonButton(
                    title: AppStrings.register.tr,
                    onTapButton: () async {
                      if (await controller.validator()) {
                        await ConfirmYourEmailBottomSheet.show(
                          context,
                          email: controller.emailController.text,
                        );
                      }
                    },
                  ),

                  SizedBox(height: Platform.isAndroid ? 10 : 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTooltip extends StatelessWidget {
  final String message;
  final double maxWidth;

  const CustomTooltip({super.key, required this.message, this.maxWidth = 220});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bubble with text
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                message,
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                ),
                softWrap: true,
              ),
            ),
          ),

          // Arrow
          CustomPaint(
            painter: ArrowPainter(direction: ArrowDirection.right),
            child: const SizedBox(width: 8, height: 20),
          ),
        ],
      ),
    );
  }
}

enum ArrowDirection { left, right, up, down }

class ArrowPainter extends CustomPainter {
  final ArrowDirection direction;
  final Color color;

  ArrowPainter({required this.direction, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();

    switch (direction) {
      case ArrowDirection.left:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        break;
      case ArrowDirection.right:
        path.moveTo(size.width, size.height / 2);
        path.lineTo(0, 0);
        path.lineTo(0, size.height);
        break;
      case ArrowDirection.up:
        path.moveTo(size.width / 2, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        break;
      case ArrowDirection.down:
        path.moveTo(size.width / 2, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
