import 'package:flutter/material.dart';
import 'package:nectar/features/forgot_password/bindings/forgotpassword_binding.dart';
import 'package:nectar/features/grocery_details/binding/GroceryDetailBinding.dart';
import 'package:nectar/features/home/components/home_controller.dart';
import 'package:nectar/features/location/bindings/location_binding.dart';
import 'package:nectar/features/login/bindings/login_binding.dart';

import 'features/sign_up/binding/sign_up_binding.dart';
import 'my_app.dart';

void main() async {
  LocationBinding().dependencies();
  SignUpBinding().dependencies();
  LoginBinding().dependencies();
  GroceryDetailBinding().dependencies();
  ForgotPasswordBinding().dependencies();
  HomeBinding().dependencies();
  runApp(MyApp());
}

