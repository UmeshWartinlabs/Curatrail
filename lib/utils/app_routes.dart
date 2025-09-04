import 'package:curatrail/screens/auth/create_password/controller/create_password_controller.dart';
import 'package:curatrail/screens/auth/create_password/view/create_password_screen.dart';
import 'package:curatrail/screens/auth/login/controller/login_screen_controller.dart';
import 'package:curatrail/screens/auth/login/view/login_screen.dart';
import 'package:curatrail/screens/auth/registration/controller/registration_controller.dart';
import 'package:curatrail/screens/auth/registration/view/registration_screen.dart';
import 'package:curatrail/screens/onboarding/controller/onboarding_screen_controller.dart';
import 'package:curatrail/screens/onboarding/view/onboarding_screen.dart';
import 'package:curatrail/screens/splash/controller/splash_screen_controller.dart';
import 'package:curatrail/screens/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const splashScreen = "/splashScreen";
  static const onboardingScreen = "/onboardingScreen";

  /// --- auth
  static const registrationScreen = "/registrationScreen";
  static const createPasswordScreen = "/createPasswordScreen";
  static const loginScreen = "/loginScreen";

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

      /// --- registration screen
      GetPage(
        name: AppRoutes.registrationScreen,
        page: () => RegistrationScreen(),
        binding: BindingsBuilder.put(() => RegistrationController()),
        transition: Transition.cupertino,
      ),

      /// --- create password screen
      GetPage(
        name: AppRoutes.createPasswordScreen,
        page: () => CreatePasswordScreen(),
        binding: BindingsBuilder.put(() => CreatePasswordController()),
        transition: Transition.cupertino,
      ),

      /// --- login screen
      GetPage(
        name: AppRoutes.loginScreen,
        page: () => LoginScreen(),
        binding: BindingsBuilder.put(() => LoginScreenController()),
        transition: Transition.cupertino,
      ),
    ];
  }
}
