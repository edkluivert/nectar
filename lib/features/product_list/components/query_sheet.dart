import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';

class QuerySheet extends StatefulWidget{
  @override
  _QuerySheet createState()=> _QuerySheet();

}
class _QuerySheet extends State<QuerySheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
          //  height: 40.h,
            width: double.infinity,
            child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: SvgPicture.asset('assets/icons/cancel.svg', width: 15.w,height: 15.h,)
                ),
                Text("Filters", style:  GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: nBlackTextColor
                ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            height: 400.h,
            //width: 500.w,
            decoration: BoxDecoration(
                color: nRadioColorBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
