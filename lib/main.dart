import 'package:curatrail/services/pref_service.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Curatrail',
       onInit: () {
         SystemChrome.setSystemUIOverlayStyle(
           SystemUiOverlayStyle(
             statusBarColor: AppColors.white,
             statusBarIconBrightness: Brightness.dark,
           ),
         );
       },
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.preSplashScreen,
      getPages: AppRoutes.getPages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: "Lato",
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w100, // Thin
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w200, // ExtraLight
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w300, // Light
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400, // Regular
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w500, // Medium
          ),
          titleLarge: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w600, // SemiBold
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700, // Bold
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w800, // ExtraBold
          ),
          displayLarge: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w900, // Black
          ),
        ),
      ),
    );
  }
}
