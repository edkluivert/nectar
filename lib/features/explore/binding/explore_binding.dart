import 'package:get/get.dart';
import 'package:nectar/features/explore/controller/explore_controller.dart';

class ExploreBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ExploreController());
  }

}