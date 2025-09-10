import 'package:curatrail/screens/auth/add_personal_info/controller/add_personal_info_screen_controller.dart';
import 'package:curatrail/screens/auth/add_personal_info/view/add_personal_info_screen.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/controller/anxiety_analytics_screen_controller.dart';
import 'package:curatrail/screens/auth/anxiety_analytics/view/anxiety_analytics_screen.dart';
import 'package:curatrail/screens/auth/create_password/controller/create_password_controller.dart';
import 'package:curatrail/screens/auth/create_password/view/create_password_screen.dart';
import 'package:curatrail/screens/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:curatrail/screens/auth/forgot_password/view/forgot_password_screen.dart';
import 'package:curatrail/screens/auth/forgot_password_otp/controller/forgot_password_otp_controller.dart';
import 'package:curatrail/screens/auth/forgot_password_otp/view/forgot_password_otp_screen.dart';
import 'package:curatrail/screens/auth/login/controller/login_screen_controller.dart';
import 'package:curatrail/screens/auth/login/view/login_screen.dart';
import 'package:curatrail/screens/auth/registration/controller/registration_controller.dart';
import 'package:curatrail/screens/auth/registration/view/registration_screen.dart';
import 'package:curatrail/screens/auth/reset_password/controller/reset_password_screen_controller.dart';
import 'package:curatrail/screens/auth/reset_password/view/reset_password_screen.dart';
import 'package:curatrail/screens/onboarding/controller/onboarding_screen_controller.dart';
import 'package:curatrail/screens/onboarding/view/onboarding_screen.dart';
import 'package:curatrail/screens/splash/controller/splash_screen_controller.dart';
import 'package:curatrail/screens/splash/view/pre_splash_screen.dart';
import 'package:curatrail/screens/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const splashScreen = "/splashScreen";
  static const preSplashScreen = "/preSplashScreen";
  static const onboardingScreen = "/onboardingScreen";

  /// --- auth
  static const registrationScreen = "/registrationScreen";
  static const createPasswordScreen = "/createPasswordScreen";
  static const loginScreen = "/loginScreen";
  static const forgotPasswordScreen = "/forgotPasswordScreen";
  static const forgotPasswordOtpScreen = "/forgotPasswordOtpScreen";
  static const resetPasswordScreen = "/resetPasswordScreen";
  static const addPersonalInfoScreen = "/addPersonalInfoScreen";
  static const anxietyAnalyticsScreen = "/anxietyAnalyticsScreen";

  static List<GetPage<dynamic>> get getPages {
    return [

      /// --- pre splash screen
      GetPage(
        name: AppRoutes.preSplashScreen,
        page: () => PreSplashScreen(),
        transition: Transition.noTransition,
      ),

      /// --- splash screen
      GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        binding: BindingsBuilder.put(() => SplashScreenController()),
        transition: Transition.noTransition,
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

      /// --- forgot password
      GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: BindingsBuilder.put(() => ForgotPasswordController()),
        transition: Transition.cupertino,
      ),

      /// --- forgot password otp screen
      GetPage(
        name: AppRoutes.forgotPasswordOtpScreen,
        page: () => ForgotPasswordOtpScreen(),
        binding: BindingsBuilder.put(() => ForgotPasswordOtpController()),
        transition: Transition.cupertino,
      ),

      /// --- forgot password otp screen
      GetPage(
        name: AppRoutes.resetPasswordScreen,
        page: () => ResetPasswordScreen(),
        binding: BindingsBuilder.put(() => ResetPasswordScreenController()),
        transition: Transition.cupertino,
      ),

      /// --- add personal info screen
      GetPage(
        name: AppRoutes.addPersonalInfoScreen,
        page: () => AddPersonalInfoScreen(),
        binding: BindingsBuilder.put(() => AddPersonalInfoScreenController()),
        transition: Transition.cupertino,
      ),

      /// --- anxiety analytics screen
      GetPage(
        name: AppRoutes.anxietyAnalyticsScreen,
        page: () => AnxietyAnalyticsScreen(),
        binding: BindingsBuilder.put(() => AnxietyAnalyticsScreenController()),
        transition: Transition.cupertino,
      ),
    ];
  }
}
