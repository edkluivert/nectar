import 'package:get/get.dart';
import 'package:nectar/features/filters/binding/filter_binding.dart';
import 'package:nectar/features/filters/controller/filter_controller.dart';
import 'package:nectar/features/filters/view/filters_screen.dart';
import 'package:nectar/features/forgot_password/bindings/forgotpassword_binding.dart';
import 'package:nectar/features/forgot_password/view/forgotpassword_screen.dart';
import 'package:nectar/features/grocery_details/binding/GroceryDetailBinding.dart';
import 'package:nectar/features/grocery_details/view/grocery_screen.dart';
import 'package:nectar/features/home/components/home_controller.dart';
import 'package:nectar/features/home/view/home_screen.dart';
import 'package:nectar/features/intro/view/intro_screen.dart';
import 'package:nectar/features/location/bindings/location_binding.dart';
import 'package:nectar/features/location/view/location_screen.dart';
import 'package:nectar/features/login/bindings/login_binding.dart';
import 'package:nectar/features/login/view/login_screen.dart';
import 'package:nectar/features/product_list/binding/productlist_binding.dart';
import 'package:nectar/features/product_list/view/productlist_screen.dart';
import 'package:nectar/features/sign_up/binding/sign_up_binding.dart';
import 'package:nectar/features/sign_up/view/sign_up.dart';

import 'app_routes.dart';

Duration get transitionDuration => const Duration(milliseconds:900);

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      transition:Transition.rightToLeft,
      transitionDuration: transitionDuration,
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoutes.INTRO,
        page: () => IntroScreen(),
        transitionDuration: transitionDuration,
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.LOCATION,
        page: () => LocationScreen(),
        transition: Transition.rightToLeft,
        binding: LocationBinding()),
    GetPage(
        name: AppRoutes.SIGN_UP,
        page: () => SignUpScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: transitionDuration,
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: transitionDuration,
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: transitionDuration,
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.GROCERY_DETAILS,
        page: () => GroceryScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: transitionDuration,
        binding: GroceryDetailBinding(),
       ),
    GetPage(
      name: AppRoutes.PRODUCT_LIST,
      page: () => ProductListScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: transitionDuration,
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.FILTER,
      page: () => FilterScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: transitionDuration,
       binding: FilterBinding(),
    ),
  ];
}
