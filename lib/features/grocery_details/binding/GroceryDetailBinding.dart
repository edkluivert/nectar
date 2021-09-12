import 'package:get/get.dart';
import 'package:nectar/features/grocery_details/controller/grocerydetails_controller.dart';

class GroceryDetailBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => GroceryDetailsController());
  }

}