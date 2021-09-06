import 'package:get/get.dart';
import 'package:nectar/features/forgot_password/controller/forgotpassword_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ForgotPasswordController());
  }

}