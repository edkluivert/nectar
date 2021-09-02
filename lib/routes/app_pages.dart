import 'package:get/get.dart';
import 'package:nectar/features/intro/view/intro_screen.dart';
import 'package:nectar/features/location/view/location_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    // GetPage(
    //   name: AppRoutes.HOME,
    //   page: () => HomeScreen(),
    //  // binding: HomeBinding(),
    // ),


    GetPage(
      name: AppRoutes.INTRO,
      page: () => IntroScreen(),
      transition: Transition.leftToRight
    ),
    GetPage(
        name: AppRoutes.LOCATION,
        page: () => LocationScreen(),
        transition: Transition.leftToRight
    ),
  ];
}