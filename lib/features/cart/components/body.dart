import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/cart/components/cart_item.dart';
import 'package:nectar/features/cart/controller/cart_controller.dart';


class Body extends StatelessWidget{

  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: _controller.grocery.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: nLineColor,
            thickness: 1,
          );
        },
        itemBuilder: (context, index){
          return CartItem(groceryModel: _controller.grocery[index],
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

}