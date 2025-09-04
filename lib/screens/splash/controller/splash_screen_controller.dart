import 'package:curatrail/utils/app_routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();

  @override
  void onInit() {

    Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed(AppRoutes.onboardingScreen);
    });

    // TODO: implement onInit
    super.onInit();
  }
}
