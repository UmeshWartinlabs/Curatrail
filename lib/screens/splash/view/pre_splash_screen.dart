import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreSplashScreen extends StatefulWidget {
  const PreSplashScreen({super.key});

  @override
  State<PreSplashScreen> createState() => _PreSplashScreenState();
}

class _PreSplashScreenState extends State<PreSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(microseconds: 100), () {
      Get.offAllNamed(AppRoutes.splashScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.white,
      ),
    );
  }
}
