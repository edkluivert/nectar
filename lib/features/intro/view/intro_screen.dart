import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/intro/components/background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/routes/app_routes.dart';

class IntroScreen extends StatefulWidget{
  @override

  _IntroScreen createState()=> _IntroScreen();


}



class _IntroScreen extends State<IntroScreen>{

  Image? myImage;
  final path = "assets/images/intro_bg.png";

  @override
  void initState() {
    super.initState();
    myImage= Image.asset(path);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage!.image, context);
  }

  Widget build(BuildContext context) {

   //SystemChrome.setEnabledSystemUIOverlays([]);

    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
                children: [
                  Expanded(child: SizedBox(height: 440.h,)),
                  Container(
                    //color: Colors.transparent,
                    height: 450.h,
                    width: double.infinity,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/app_icon.svg', width: 48.w,height: 56.h,),
                        SizedBox(height: 35.h,),
                        SizedBox(
                          width: 280.w,
                          height: 130.h,
                          child: Column(
                            children: [
                              Text(welcomeText,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 48.sp,
                                  color: Colors.white,

                                ),
                              ),
                              Text(" to our store",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 48.sp,
                                  color: Colors.white,

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        SizedBox(
                          height: 20.h,
                          child: Text(welcomeTextSub,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h,),
                        PrimaryButton(text: "Get Started",
                            onClick: (){
                              Get.toNamed(AppRoutes.LOCATION);
                            }
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }

}