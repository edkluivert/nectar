import 'package:get/get.dart';
import 'package:nectar/core/model/grocery_model.dart';


class StoreController extends GetxController{

  late final GroceryModel groceryModel;

  var bannerIndex = 0;


  void changeBannerIndex(int index) {
    bannerIndex = index;
    update();
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
