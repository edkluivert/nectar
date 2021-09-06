import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/features/forgot_password/components/forgotpassword_form.dart';

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
            Text("Reset Password",style: GoogleFonts.montserrat(
                fontSize: 26.sp,
                color: nTextFieldColor,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 15.h,),
            Text("Enter your email to reset password",style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                color: nGreyTextColor,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 40.h,),
            ForgotPasswordForm(),
          ],
        ),
      ),
    ),
    );
  }

}