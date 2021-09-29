import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';

class CategoryItem extends StatelessWidget{

  int color;
  String title;
  String img;

  CategoryItem({
    required this.color, required this.title, required this.img
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      decoration: BoxDecoration(
        color: Color(color).withOpacity(0.10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 15.h, bottom: 17.h),
        child: Row(
          children: [
            Image.asset(img, width: 71.w, height: 71.h,),
            SizedBox(width: 15.w,),
            Text(title, style: GoogleFonts.montserrat(
              fontSize: 20.sp,
              color: nBlackTextColor,
              fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }


}