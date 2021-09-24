import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/grocery_model.dart';
import 'package:nectar/features/cart/controller/cart_controller.dart';

class CartItem extends StatelessWidget{

  GroceryModel groceryModel;

  CartItem({
  required this.groceryModel
});


  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
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
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                    children: [
                      Text(groceryModel.name, style : GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: nBlackTextColor,
                          fontSize: 18.sp
                      )),
                      SizedBox(height: 5.h,),
                      Text("${groceryModel.amount.toString()} pieces", style : GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: nGreyTextColor,
                          fontSize: 14.sp
                      )),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      SizedBox(
                                height: 47.h,
                                width: 133.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 45.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                          border: Border.all(
                                              color: nLineColor,
                                              width: 1.w
                                          )

                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          _controller.decrement(groceryModel);
                                        },
                                          icon: Icon(
                                            Icons.remove, color : nGreyTextColor),
                                      ),
                                    ),
                                    Center(
                                      child: Text(groceryModel.amount.toString(),style: GoogleFonts.montserrat(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: nBlackTextColor
                                      ),),
                                    ),
                                    Container(
                                      width: 45.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                          border: Border.all(
                                              color: nLineColor,
                                              width: 1.w
                                          ),

                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          _controller.increment(groceryModel);
                                        },
                                        icon: Icon(
                                            Icons.add, color : nPrimaryColor),
                                      ),
                                    ),

                                  ],
                                ),
                              ),



                        ],
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset('assets/icons/cancel.svg')),
                      Text("${symbolN}${groceryModel.price}",
                          style : GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: nBlackTextColor,
                              fontSize: 18.sp
                          ))
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}
