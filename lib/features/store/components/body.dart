import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/banner_model.dart';
import 'package:nectar/features/store/components/banner_slide.dart';
import 'package:nectar/features/store/controller/store_controller.dart';

class Body extends StatelessWidget{

  final _controller = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
             SvgPicture.asset('assets/icons/carrot.svg', width: 20.w, height: 23.h,),
            SizedBox(height: 5.h,),
            Text("Obio Akpor, Port harcourt", style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: nBlackTextColor
            ),),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 51.w,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Store',
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: GoogleFonts.montserrat(
                      color: nGreyTextColor.withOpacity(0.30),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp
                  ),
                  prefixIcon: Icon(Icons.search,color: Color(0xFF181B19),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Color(0xFFF2F3F2),
                  filled: true
                ),
              ),
            ),
            SizedBox(height: 50.h,),
            Stack(
              children: [
                Container(
                  width: 368.w,
                  height: 114.h,
                  child: PageView.builder(
                      itemBuilder: (context , index){
                        return Opacity(
                          opacity: _controller.bannerIndex == index ? 1.0 : 0.8,
                          child: BannerSlide(
                             bannerModel: banner[index],

                          ),
                        );
                      },
                    itemCount: banner.length,
                    controller: PageController(
                        initialPage: 0, viewportFraction: 1.05),
                        onPageChanged: (index){
                        //_controller.bannerIndex = index;
                          _controller.changeBannerIndex(index);
                          print("hello $index");
                     }
                    ),
                  ),
                Positioned(
                  top: 100.h,
                    left: 130.w,
                    right: 130.w,
                    child: updateIndicators())
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget updateIndicators() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: banner.map(
            (banners) {
          var index = banner.indexOf(banners);

          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              _controller.bannerIndex == index ? nPrimaryColor : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }
}