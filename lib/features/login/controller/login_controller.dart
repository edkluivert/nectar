import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';


  var hideText = true.obs;

  void toggle(){
    hideText.toggle();
  }


  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();


  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be more than 6 characters";
    }
    return null;
  }




}