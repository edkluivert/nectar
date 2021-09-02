import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/custom_drop_down.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/location/components/location_bg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget{

    @override
    _LocationScreen createState()=> _LocationScreen();

}
class _LocationScreen extends State<LocationScreen>{
  @override
  Widget build(BuildContext context) {

    final List<String> subjects = ["Computer Science", "Biology", "Math"];



    return Stack(
      children: [
        LocationBg(),
        Scaffold(
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70.h,),
              Center(child: Image.asset('assets/images/location_icon.png', width: 224.w, height: 170.h,)),
              SizedBox(height: 40.h,),
              Center(
                child: Text("Select Your Location",
                  style: GoogleFonts.montserrat(
                      color: nBlackTextColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Center(
                child: SizedBox(
                  width: 363.w,
                  height: 57.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Switch on your location to stay in tune with",
                        style: GoogleFonts.montserrat(
                            color: nGreyTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text("what’s happening in your area",
                        style: GoogleFonts.montserrat(
                            color: nGreyTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 89.h,),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Zone",
                      style: GoogleFonts.montserrat(
                          color: nGreyTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    // SizedBox(height: 10.h,),
                    Container(
                      width: 364.w,
                      //height: 40,
                      decoration: BoxDecoration(
                        //color: Colors.grey[100],
                          border: Border(
                              bottom: BorderSide(
                                  color: nLineColor
                              )
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 5.h),
                        child: DropdownButton<String>(
                          value: subjects.elementAt(0),
                          style: GoogleFonts.montserrat(
                              color: nBlackTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          items: subjects.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (item) {

                          },
                          isExpanded: true,
                          underline: Container(

                          ),
                          icon: SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                            height: 10.h,
                            width: 7.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Text("Your Area",
                      style: GoogleFonts.montserrat(
                          color: nGreyTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    //SizedBox(height: 10.h,),
                    Container(
                      width: 364.w,
                      //height: 40,
                      decoration: BoxDecoration(
                        //color: Colors.grey[100],
                          border: Border(
                              bottom: BorderSide(
                                  color: nLineColor
                              )
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 5.h),
                        child: DropdownButton<String>(
                          value: subjects.elementAt(0),
                          style: GoogleFonts.montserrat(
                              color: nBlackTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          items: subjects.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (item) {

                          },
                          isExpanded: true,
                          underline: Container(

                          ),
                          icon: SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                            height: 10.h,
                            width: 7.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    PrimaryButton(text: "Submit",
                        onClick: (){
                          // Get.toNamed(AppRoutes.LOCATION);
                        }
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}