import 'package:curatrail/services/pref_service.dart';
import 'package:curatrail/utils/app_colors.dart';
import 'package:curatrail/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.white, // top safe area
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white, // bottom safe area
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Curatrail',
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

      builder: (context, child) {
        final bottomInset = MediaQuery.of(context).padding.bottom;
        final systemStyle = SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemStyle,
          child: Stack(
            children: [
              if (child != null) child,
              if (bottomInset > 0)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: bottomInset,
                    color: AppColors.white,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
