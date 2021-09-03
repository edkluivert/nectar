import 'package:get/get.dart';
import 'package:nectar/features/location/controller/location_controller.dart';

class LocationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());

  }

}