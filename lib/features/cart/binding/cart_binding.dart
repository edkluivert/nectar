import 'package:get/get.dart';
import 'package:nectar/features/cart/controller/cart_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }

}