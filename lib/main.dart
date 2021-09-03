import 'package:flutter/material.dart';
import 'package:nectar/features/location/bindings/location_binding.dart';
import 'package:nectar/features/sign_up/components/binding/sign_up_binding.dart';

import 'my_app.dart';

void main() async {
  LocationBinding().dependencies();
  SignUpBinding().dependencies();
  runApp(MyApp());
}

