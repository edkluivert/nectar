import 'package:flutter/material.dart';
import 'package:nectar/features/explore/binding/explore_binding.dart';
import 'package:nectar/features/forgot_password/bindings/forgotpassword_binding.dart';
import 'package:nectar/features/grocery_details/binding/GroceryDetailBinding.dart';
import 'package:nectar/features/location/bindings/location_binding.dart';
import 'package:nectar/features/login/bindings/login_binding.dart';
import 'package:nectar/features/product_list/binding/productlist_binding.dart';

import 'features/cart/binding/cart_binding.dart';
import 'features/filters/binding/filter_binding.dart';
import 'features/home/binding/home_controller.dart';
import 'features/sign_up/binding/sign_up_binding.dart';
import 'my_app.dart';

void main() async {
  LocationBinding().dependencies();
  SignUpBinding().dependencies();
  LoginBinding().dependencies();
  GroceryDetailBinding().dependencies();
  ForgotPasswordBinding().dependencies();
  HomeBinding().dependencies();
  ExploreBinding().dependencies();
  ProductListBinding().dependencies();
  FilterBinding().dependencies();
  CartBinding().dependencies();
  runApp(MyApp());
}

