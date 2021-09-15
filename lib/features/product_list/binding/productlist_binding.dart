import 'package:get/get.dart';
import 'package:nectar/features/product_list/controller/productlist_controller.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListController());
  }

}