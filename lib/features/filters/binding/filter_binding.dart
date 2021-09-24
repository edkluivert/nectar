import 'package:get/get.dart';
import 'package:nectar/features/filters/controller/filter_controller.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => FilterController());
  }

}