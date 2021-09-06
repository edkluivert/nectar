import 'package:get/get.dart';

class StoreController extends GetxController{

  var bannerIndex = 0;

  void changeBannerIndex(int index) {
    bannerIndex = index;
    update();
  }

}