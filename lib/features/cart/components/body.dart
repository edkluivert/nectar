import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/cart/components/cart_item.dart';
import 'package:nectar/features/cart/controller/cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Body extends GetView<CartController>{


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 450.h,
              child: GetBuilder<CartController>(
                init: Get.put(CartController()),
                builder : (controller)  => ListView.separated(
                  itemCount: controller.grocery.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: nLineColor,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index){
                    return CartItem(groceryModel: controller.grocery[index],
                      index: index,
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              PrimaryButton(text: "Go To Checkout", onClick: (){

              }),
              Positioned(
                left: 280.w,
                top: 25.h,
                child: Container(
                  height: 20.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF489E67),
                    borderRadius: BorderRadius.circular(2.r)
                  ),
                  child: Center(
                    child: GetBuilder<CartController>(
                     init: Get.find(),
                    builder : (controller)  => Text("$symbolN${controller.totalPrice}", style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        color: Colors.white,

                      ),),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height : 30.h)
        ],
      ),
    );
  }

}