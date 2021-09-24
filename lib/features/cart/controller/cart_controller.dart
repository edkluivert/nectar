import 'package:get/get.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/grocery_model.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController{

  var amountOfitem = 0.obs;
 var priceOfItem = 1.obs;


 void increment(GroceryModel groceryModel){
   groceryModel.amount++;
   update();
 }
  void decrement(GroceryModel groceryModel){
    if(groceryModel.amount <= 1){
      Get.snackbar("Error", "Grocery can not be less than 1 item",
      icon: Icon(Icons.error_outline),
          barBlur: 20,
        backgroundColor: nPrimaryColor.withOpacity(0.3),
        isDismissible: true,
        duration: Duration(seconds: 2)
      );
    }else{
      groceryModel.amount--;
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