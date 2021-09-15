import 'package:get/get.dart';
import 'package:nectar/core/model/grocery_model.dart';

class ProductListController extends GetxController{


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