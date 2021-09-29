import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/banana.png'),
                      backgroundColor: Colors.transparent,
                      radius: 30.r,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Ed kluivert",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20.sp,
                                        color: nBlackTextColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                    SvgPicture.asset('assets/icons/pen.svg', width: 15.w, height: 15.h,),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "edkluivert@gmail.com",
                            style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                color: nGreyTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Divider(
                      color: nLineColor,
                      thickness: 1,
                    ),
                    profileItems("Shipping Addresses", Icons.mail),
                    Divider(
                      color: nLineColor,
                      thickness: 1,
                    ),
                    profileItems("Payment Methods", Icons.mail),
                    Divider(
                      color: nLineColor,
                      thickness: 1,
                    ),
                    profileItems("My Deliveries", Icons.mail),
                    Divider(
                      color: nLineColor,
                      thickness: 1,
                    ),
                    profileItems("My Settings", Icons.mail),
                    Divider(
                      color: nLineColor,
                      thickness: 1,
                    ),
                    SizedBox(height: 250.h,),
                    Container(
                      width: 364.w,
                      height: 67.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F3F2),
                        borderRadius: BorderRadius.circular(15.r)
                      ),
                      child: Stack(
                        children: [
                             Positioned(
                                 top: 24.h,
                                 left: 24.w,
                                 bottom: 24.h,
                                 child: SvgPicture.asset('assets/icons/exit.svg', width: 18.w,
                                 height : 18.h)),
                          Center(
                            child: Text(
                              "Log Out",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18.sp,
                                  color: nPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget profileItems(String title, IconData icon,){
    return  Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        splashColor: nLineColor,
        child: Container(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: nBlackTextColor,),
                  SizedBox(width: 10.w,),
                  Text(
                   title,
                    style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        color: nBlackTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: nBlackTextColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }

}