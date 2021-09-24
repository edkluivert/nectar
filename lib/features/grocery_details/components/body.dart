import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/grocery_image.dart';
import 'package:nectar/core/model/grocery_model.dart';
import 'package:nectar/features/grocery_details/controller/grocerydetails_controller.dart';
import 'package:palette_generator/palette_generator.dart';

import 'image_slide.dart';
import 'rating_star.dart';

class Body extends StatefulWidget{



  @override
  _Body createState()=> _Body();


}
class _Body extends State<Body>{

  var data = Get.arguments;

  final _controller = Get.find<GroceryDetailsController>();

  double rating = 5.0;


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

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF2F3F2),
        systemNavigationBarColor: nPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: nPrimaryColor,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(dark);

    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 371.h,
            decoration: BoxDecoration(
                color: Color(0xFFF2F3F2),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r,),
                    bottomRight: Radius.circular(40.r,)
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                       onPressed: (){
                         Get.back();
                       },
                        icon: Icon( Icons.arrow_back_ios,
                          color: nBlackTextColor,),
                      ),
                      SvgPicture.asset('assets/icons/download.svg'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 270.h,
                      color: Colors.transparent,
                      child: PageView.builder(
                          itemBuilder: (context, index) {
                            return ImageSlide(
                              image: groceryImage[index],
                            );
                          },
                          itemCount: groceryImage.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentPage = index;
                            });
                            print("hello $index");
                          }),
                    ),
                    Positioned(
                        top: 260.h,
                        left: 130.w,
                        right: 130.w,
                        child: updateIndicators())
                  ],
                ),


              ],
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Apple", style: GoogleFonts.montserrat(
                             fontWeight: FontWeight.w700,
                             fontSize: 24.sp,
                             color : nBlackTextColor
                           ),),
                           Text("4 kg", style: GoogleFonts.montserrat(
                               fontWeight: FontWeight.w400,
                               fontSize: 16.sp,
                               color : nGreyTextColor
                           ),)
                         ],
                       ),
                     Padding(
                       padding: EdgeInsets.only(top: 6.h),
                       child: SizedBox(
                         width: 24.w,
                         height: 24.h,
                         child: SvgPicture.asset('assets/icons/bookmark.svg'),
                       ),
                     ),
                     ],
                   ),
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                      ()=>SizedBox(
                          height: 45.h,
                          width: 119.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            GestureDetector(
                                onTap: (){
                                  _controller.decrement();
                                },
                              child: Icon(
                                Icons.remove, color : nGreyTextColor)
                              ),
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
                                child: Center(
                                  child: Text(_controller.numOfItem.toString(),style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: nBlackTextColor
                                  ),),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  _controller.increment();
                                },
                                child: Icon(
                                    Icons.add, color : nPrimaryColor),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Text("${symbolN}400.0",
                          style : GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: nBlackTextColor,
                              fontSize: 24.sp
                          ))
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Divider(
                    color: nLineColor.withOpacity(0.5),
                    thickness:1,
                    endIndent: 15,
                  ),
                  productDetails("Product Details", dummyDesc),
                  SizedBox(height: 10.h,),
                  Divider(
                    color: nLineColor.withOpacity(0.5),
                    thickness:1,
                    endIndent: 15,
                  ),
                  productNutrients("Nutrients"),
                  SizedBox(height: 10.h,),
                  Divider(
                    color: nLineColor.withOpacity(0.5),
                    thickness:1,
                    endIndent: 15,
                  ),
                  productReview("Review"),
                  SizedBox(height: 20.h,),
                  PrimaryButton(text: "Add To Basket", onClick: (){

                  }),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget productDetails(String title, String content){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: nBlackTextColor,
                fontSize: 16.sp,)),
              IconButton(
                icon: Icon(
                    _controller.hideTextDetails.isTrue ? Icons.keyboard_arrow_up :
                    Icons.keyboard_arrow_right,
                  size : 30,
                ),
                onPressed: () {
                  setState(() {
                    _controller.toggleDetails();
                  });
                },
              ),
            ],
          ),
          _controller.hideTextDetails.isTrue
              ? Container(
             // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(content,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: nGreyTextColor,
                  fontSize: 13.sp,
                ),
              ) ) : Container()
        ],
      ),

    );
  } 
  Widget productNutrients(String title){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: nBlackTextColor,
                fontSize: 16.sp,)),

              SizedBox(
                width: 90.w,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: 33.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: nLineColor,
                          borderRadius: BorderRadius.circular(18.r)
                        ),
                        child: Center(
                          child: Text("100gb", style:  GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: nGreyTextColor,
                            fontSize: 8.sp,),),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          _controller.hideImageNutrient.isTrue ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_right,
                        size : 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.toggleNutrientsImage();
                        });
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
          _controller.hideImageNutrient.isTrue
              ? Center(
                child: Image.asset('assets/images/banner.png', width: 300.w,
                  height: 100.h,),
              ) : Container()
        ],
      ),

    );
  }

  Widget productReview(String title){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: nBlackTextColor,
                fontSize: 16.sp,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StarRating(
                    rating: rating,
                    size: 20,
                    onRatingChanged: (rating) => setState(() => this.rating = rating),
                    color: nPrimaryColor,
                  ),
                  IconButton(
                    icon: Icon(
                        _controller.hideReviewDetails.isTrue ?
                        Icons.keyboard_arrow_up : Icons.keyboard_arrow_right,
                      size : 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.toggleReview();
                      });
                    },
                  ),
                ],
              ),

            ],
          ),
          _controller.hideReviewDetails.isTrue
              ? Center(
            child: Image.asset('assets/images/banner.png', width: 300.w,
              height: 100.h,),
          ) : Container()
        ],
      ),

    );
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: groceryImage.map(
            (image) {
          var index = groceryImage.indexOf(image);
          return Container(
            width: 10.w,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(5.r),
              color: currentPage == index ? nPrimaryColor : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }




}