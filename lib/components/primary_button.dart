import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PrimaryButton extends StatelessWidget{
  final String text;
  final Function onClick;

  const PrimaryButton({
    required this.text,
    required this.onClick,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return   SizedBox(
     width: 353.w,
     height: 67.h,
     child: ElevatedButton(
       onPressed: (){
        onClick();
       },
       style:  ElevatedButton.styleFrom(
         //elevation: 10,
         //shadowColor: wPrimaryColorDark,
         primary: nPrimaryColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.r), // <-- Radius
         ),
         textStyle: GoogleFonts.montserrat(
           fontSize: 18.sp,
           color: Colors.white,
           fontWeight: FontWeight.w600,
         ),
       ),
       child: Text(
         text,
       ),
     ),
   );
  }

}