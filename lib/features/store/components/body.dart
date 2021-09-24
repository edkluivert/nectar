import 'dart:async';

import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/components/store_item.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/banner_model.dart';
import 'package:nectar/features/store/components/banner_slide.dart';
import 'package:nectar/features/store/controller/store_controller.dart';
import 'package:nectar/routes/app_routes.dart';
import 'package:palette_generator/palette_generator.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final _controller = Get.find<StoreController>();
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,viewportFraction: 1.05,
  );


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset(
              'assets/icons/carrot.svg',
              width: 20.w,
              height: 23.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Obio Akpor, Port Harcourt",
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
            SizedBox(
              height: 50.h,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 114.h,
                  child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Opacity(
                          opacity: currentPage == index ? 1.0 : 0.8,
                          child: BannerSlide(
                            bannerModel: banner[index],
                          ),
                        );
                      },
                      itemCount: banner.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                        print("hello $index");
                      }),
                ),
                Positioned(
                    top: 100.h,
                    left: 130.w,
                    right: 130.w,
                    child: updateIndicators())
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Exclusive Offer", style: GoogleFonts.montserrat(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: nBlackTextColor
                ),),
                Text("See all", style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: nPrimaryColor
                ),),
              ],
            ),
            SizedBox(height: 30.h,),
            Container(
              width: double.infinity,
              height: 270.h,
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemBuilder: (context, index){
                  return StoreItem(itemName: _controller.grocery[index].name,
                    imageLink : _controller.grocery[index].img,
                    itemWeight: _controller.grocery[index].weight,
                    itemPrice : _controller.grocery[index].price, itemAmount: _controller.grocery[index].amount,
                    id: _controller.grocery[index].id,
                    index: index,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Selling", style: GoogleFonts.montserrat(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: nBlackTextColor
                ),),
                Text("See all", style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: nPrimaryColor
                ),),
              ],
            ),
            SizedBox(height: 24.h,),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.64,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,),
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, index) {
                  return StoreItem(itemName: _controller.grocery[index].name,
                    imageLink :  _controller.grocery[index].img,
                    itemWeight: _controller.grocery[index].weight,
                    itemPrice : _controller.grocery[index].price, itemAmount: _controller.grocery[index].amount,
                    id: _controller.grocery[index].id,
                    index: index,

                  );
                }
            ),
            SizedBox(height: 20.h,),
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
            width: 10.w,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.r),
              color: currentPage == index ? nPrimaryColor : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }
}
