import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

// THIS FUNCTION WILL NAVIGATE FROM SPLASH SCREEN TO HOME SCREEN.

  void navigationToNextPage() {
    Get.offNamed(AppRoutes.INTRO);
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {

    // To make this screen full screen.
    // It will hide status bar and notch.

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: nPrimaryColor,
        systemNavigationBarColor: nPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: nPrimaryColor,
        statusBarIconBrightness: Brightness.light);

   // SystemChrome.setEnabledSystemUIOverlays([]);

    // full screen image for splash screen.
    return Scaffold(
      backgroundColor: nPrimaryColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 68.h,
            width: 270.w,
            child: Row(
              children: [
                new SvgPicture.asset('assets/icons/app_icon.svg',width: 54,height: 63.h, ),
                SizedBox(width: 18.w,),
                Column(
                  children: [
                     SvgPicture.asset('assets/images/app_name.svg', width: 194.w,height: 46.h, ),
                    Center(
                      child: Text("online groceries",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        letterSpacing: 5,
                        color: Colors.white
                       ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}