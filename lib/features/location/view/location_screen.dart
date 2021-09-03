import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/location/components/location_bg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/features/location/components/location_form.dart';

class LocationScreen extends StatefulWidget{

    @override
    _LocationScreen createState()=> _LocationScreen();

}
class _LocationScreen extends State<LocationScreen>{



  Widget build(BuildContext context) {


    return Stack(
      children: [
        LocationBg(),
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                SizedBox(height: 60.h,),
               LocationForm()
              ],
            ),
          ),
        ),
      ],
    );
  }

}