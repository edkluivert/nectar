import 'package:get/get.dart';
import 'package:nectar/features/login/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LoginController());
  }

}