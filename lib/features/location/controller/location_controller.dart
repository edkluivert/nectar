import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController{
  late TextEditingController stateController, localController, streetController;

  var email = '';
  var password = '';
  var street = '';


  @override
  void onInit() {
    super.onInit();
    stateController = TextEditingController();
   localController = TextEditingController();
   streetController =  TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    stateController.dispose();
    localController.dispose();
    streetController.dispose();
  }



  String? validateState(String value) {
    if (value.isEmpty) {
      return "Please Provide State";
    }
    return null;
  }

  String? validateLocal(String value) {
    if (value.isEmpty) {
      return "Please Provide Local Government";
    }
    return null;
  }
  String? validateStreet(String value) {
    if (value.isEmpty) {
      return "Please Provide Street";
    }
    return null;
  }


}