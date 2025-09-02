import 'package:curatrail/screens/onboarding/controller/onboarding_screen_controller.dart';
import 'package:curatrail/screens/onboarding/view/onboarding_screen.dart';
import 'package:curatrail/screens/splash/controller/splash_screen_controller.dart';
import 'package:curatrail/screens/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const splashScreen = "/splashScreen";
  static const onboardingScreen = "/onboardingScreen";

  static List<GetPage<dynamic>> get getPages {
    return [

      /// --- splash screen
      GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        binding: BindingsBuilder.put(() => SplashScreenController()),
        transition: Transition.cupertino,
      ),

      /// --- onboarding screen
      GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => OnboardingScreen(),
        binding: BindingsBuilder.put(() => OnboardingScreenController()),
        transition: Transition.cupertino,
      ),
    ];
  }
}
