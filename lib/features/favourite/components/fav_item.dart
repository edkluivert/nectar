import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/grocery_model.dart';
import 'package:nectar/features/favourite/controller/fav_controller.dart';

class FavItem extends StatelessWidget{

  GroceryModel groceryModel;
  int index;

  FavItem({
  required this.groceryModel,
    required this.index
});


  final _controller = Get.find<FavController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: Stack(
        children: [
          Positioned(
              top: 46.h,
              left: 25.w,
              child: Image.asset(groceryModel.img,height: 64.h,width: 70.w,)),
          Positioned(
            top: 30.h,
            left: 140.w,
            child: Container(
              width: 260.w,
              height: 120.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(groceryModel.name, style : GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: nBlackTextColor,
                          fontSize: 18.sp
                      )),
                      SizedBox(height: 5.h,),
                      Text("${groceryModel.weight.toString()}", style : GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: nGreyTextColor,
                          fontSize: 14.sp
                      )),

                    ],
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$symbolN${groceryModel.price}",
                        style : GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: nBlackTextColor,
                            fontSize: 18.sp
                        )),
                    Icon(Icons.arrow_forward_ios, color: nBlackTextColor,)
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}
