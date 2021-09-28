import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/favourite/controller/fav_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'fav_item.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Container(
            height: 450.h,
            child: GetBuilder<FavController>(
              init: Get.put(FavController()),
              builder : (controller)  => ListView.separated(
                itemCount: controller.grocery.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: nLineColor,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index){
                  return FavItem(groceryModel: controller.grocery[index],
                    index: index,
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
          PrimaryButton(text: "Add All To Cart", onClick: (){

          })
        ],
      ),
    );
  }

}