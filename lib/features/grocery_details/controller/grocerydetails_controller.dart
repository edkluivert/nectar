import 'package:get/get.dart';
import 'package:nectar/core/model/grocery_model.dart';

class GroceryDetailsController extends GetxController{

  late GroceryModel groceryModel;

  var hideTextDetails = false.obs;
  var hideImageNutrient = false.obs;
  var hideReviewDetails = false.obs;
  var numOfItem = 1.obs;

  void toggleDetails(){
    hideTextDetails.toggle();
  }
  void toggleNutrientsImage(){
    hideImageNutrient.toggle();
  }
  void toggleReview(){
    hideReviewDetails.toggle();
  }


  increment()=>numOfItem++;
  decrement()=>numOfItem--;

}