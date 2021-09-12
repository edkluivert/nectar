import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/login/components/login_form.dart';
import 'package:nectar/routes/app_routes.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h,),
            Center(child: SvgPicture.asset('assets/icons/carrot.svg',height: 80.h,width: 80.w,)),
            SizedBox(height: 100.h,),
            Text("Log In",style: GoogleFonts.montserrat(
                fontSize: 26.sp,
                color: nTextFieldColor,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 15.h,),
            Text(loginTextDesc,style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                color: nGreyTextColor,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 40.h,),
            LoginForm(),
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                  style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      color: nGreyTextColor,
                      fontWeight: FontWeight.w500
                  ),),
                GestureDetector(
                  onTap: (){
                    Get.offAndToNamed(AppRoutes.SIGN_UP);
                  },
                  child: Text( ' Sign Up', style: GoogleFonts.montserrat(
                      fontSize: 15.sp,
                      color: nPrimaryColor,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }

}