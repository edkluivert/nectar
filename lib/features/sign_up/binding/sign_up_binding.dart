import 'package:get/get.dart';
import 'package:nectar/features/sign_up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SignUpController());
  }

}
