import 'package:get/get.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/grocery_model.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController{


 double totalPrice = 0.0;


 void increment(int index){
   grocery[index].amount++;
   totalPrice += grocery[index].price * grocery[index].amount;
   update();
 }
  void decrement(int index){
    if(grocery[index].amount <= 1){
      Get.snackbar("Error", "Grocery can not be less than 1 item",
      icon: Icon(Icons.error_outline),
          barBlur: 20,
        backgroundColor: nPrimaryColor.withOpacity(0.3),
        isDismissible: true,
        duration: Duration(seconds: 2)
      );
    }else{
      grocery[index].amount--;
      totalPrice -= grocery[index].price * grocery[index].amount;
      update();
    }
  }



  var grocery = [
    GroceryModel(name: "banana",
        amount: 4, price: 300.0,
        img: 'assets/images/banana.png',
        weight: 5, id: 1),
    GroceryModel(id : 2, name: "potato",
        amount: 4, price: 300.0,
        img: 'assets/images/banana.png',
        weight: 5),
  ];

}