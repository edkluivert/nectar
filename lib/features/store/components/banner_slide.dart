import 'package:flutter/material.dart';
import 'package:nectar/core/model/banner_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlide extends StatelessWidget {
  BannerSlide({required this.bannerModel});

  BannerModel bannerModel;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          //top: 32.0,
          //left: 8.0,
         // right: 8.0,
        ),
        child: Container(
          width: 368.w,
          height: 114.h,
          decoration: BoxDecoration(
            // color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10.r),
            // boxShadow: [
            //   BoxShadow(
            //       color: kShadowColor, offset: Offset(0, 20), blurRadius: 10.0),
            // ],
            image: DecorationImage(
                image: AssetImage(bannerModel.asset,
                ), fit: BoxFit.cover),
          ),

        ),
      ),
    );
  }
}