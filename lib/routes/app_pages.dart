import 'package:get/get.dart';
import 'package:nectar/features/intro/view/intro_screen.dart';
import 'package:nectar/features/location/bindings/location_binding.dart';
import 'package:nectar/features/location/view/location_screen.dart';
import 'package:nectar/features/sign_up/components/binding/sign_up_binding.dart';
import 'package:nectar/features/sign_up/view/sign_up.dart';

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
        transition: Transition.leftToRight,
        binding: LocationBinding()
    ),
    GetPage(
        name: AppRoutes.SIGN_UP,
        page: () => SignUpScreen(),
        transition: Transition.leftToRight,
        binding: SignUpBinding()
    ),

  ];
}