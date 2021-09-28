import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
                  height: 45.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My profile",
                    style: GoogleFonts.montserrat(
                        fontSize: 25.sp,
                        color: nPrimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
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
                              Text(
                                "Ed kluivert",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Text(
                            "edkluivert@gmail.com",
                            style: GoogleFonts.montserrat(
                                fontSize: 10.sp,
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){

                        },
                        splashColor: nGreyTextColor,
                        // hoverColor: wPrimaryColor,
                        child: Container(
                          height: 50.h,
                          // color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Cart",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: nGreyTextColor.withOpacity(0.2),
                      thickness: 1,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        splashColor: nLineColor,
                        child: Container(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping addresses",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: nGreyTextColor,
                      thickness: 1,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        splashColor: nLineColor,
                        child: Container(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment methods",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: nGreyTextColor,
                      thickness: 1,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        splashColor: nLineColor,
                        child: Container(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Deliveries",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: nGreyTextColor,
                      thickness: 1,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){},
                        splashColor: nLineColor,
                        child: Container(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Settings",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: nBlackTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: nGreyTextColor,
                      thickness: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

}