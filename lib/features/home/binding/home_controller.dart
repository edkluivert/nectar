import 'package:get/get.dart';
import 'package:nectar/features/account/controller/account_controller.dart';
import 'package:nectar/features/cart/controller/cart_controller.dart';
import 'package:nectar/features/explore/controller/explore_controller.dart';
import 'package:nectar/features/favourite/controller/fav_controller.dart';
import 'package:nectar/features/home/controller/home_controller.dart';
import 'package:nectar/features/store/controller/store_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => StoreController());
    Get.lazyPut(() => ExploreController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => FavController());
    Get.lazyPut(() => AccountController());
  }

}