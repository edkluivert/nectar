import 'package:get/get.dart';
import 'package:nectar/features/intro/view/intro_screen.dart';
import 'package:nectar/features/splash/view/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    // GetPage(
    //   name: AppRoutes.HOME,
    //   page: () => HomeScreen(),
    //  // binding: HomeBinding(),
    // ),

    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.INTRO,
      page: () => IntroScreen(),
      transition: Transition.leftToRight
    ),

  ];
}