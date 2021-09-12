import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/model/grocery_image.dart';
import 'package:nectar/core/model/grocery_model.dart';

class ImageSlide extends StatelessWidget {
  ImageSlide({required this.image});

 GroceryImageModel image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
           // top: 2.h,
            left: 30,
            right: 10,
            child: Container(
              width: 368.w,
              height: 230.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur( sigmaY: 20,sigmaX: 20),
                  child:Image.asset(image.img, width: 368.w, height: 200.h,
                     // fit: BoxFit.cover
                  ),
              ) ,
            ),
          ),
          Container(
            width: 368.w,
            height: 230.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              // image: DecorationImage(
              //     image: AssetImage(image.img,
              //     ), fit: BoxFit.cover),
            ),
             child: Image.asset(image.img, width: 368.w, height: 200.h,
                 fit: BoxFit.cover
             ),
          ),
        ],
      ),
    );
  }
}