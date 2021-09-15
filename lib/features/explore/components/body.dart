import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/explore/components/products_item.dart';
import 'package:nectar/features/explore/controller/explore_controller.dart';

class Body extends StatelessWidget{

  final _controller = Get.find<ExploreController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Find Products",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: nBlackTextColor),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 51.w,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Store',
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: GoogleFonts.montserrat(
                        color: nGreyTextColor.withOpacity(0.30),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF181B19),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none),
                    fillColor: Color(0xFFF2F3F2),
                    filled: true),
              ),
            ),
            SizedBox(height: 20.h,),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.76,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,),
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, index) {
                  return ProductItem(productColor: _controller.productColor[index],
                      productBorderColor: _controller.productBorderColor[index],
                      productImage: _controller.productImages[index],
                      productName: _controller.productName[index],
                      index: index,
                  );
                }
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    ));
  }

}