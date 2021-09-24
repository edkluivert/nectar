import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/filters/controller/filter_controller.dart';

class FilterScreen extends StatefulWidget{

  @override
  _FilterState createState()=>_FilterState();

}
class _FilterState extends State<FilterScreen>{

  final controller = Get.find<FilterController>();
  bool valueEgg = false;
  bool valuePasta = false;
  bool valueChips = false;
  bool valueFastFood = false;

  bool valuePepsi = false;
  bool valueCoke = false;
  bool valueGino = false;
  bool valueIndomie = false;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Theme(
       data: ThemeData(
           unselectedWidgetColor: nRadioColorBg
       ),
       child: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               Container(
                 height: 50.h,
                 color: Colors.white,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(left: 10.w),
                       child: GestureDetector(
                           onTap: (){
                             Get.back();
                           },
                           child: SvgPicture.asset('assets/icons/cancel.svg', width: 17.w,height: 17.h,)),
                     ),
                     //SizedBox(width: MediaQuery.of(context).size.width / 2.8,),
                     Text("Filters", style: GoogleFonts.montserrat(
                       fontSize: 18.sp,
                       color : nBlackTextColor,
                       fontWeight: FontWeight.w700
                     ),),
                     Container(),
                   ],
                 ),
               ),
               SizedBox(height: 30.h,),
               Container(
                 height:750.h,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color : Color(0xFFF2F2F2),
                   borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r)
                   )
                 ),
                 child: Padding(
                   padding: EdgeInsets.only(left: 25.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                         SizedBox(height: 20.h,),
                          Text("Categories",style: GoogleFonts.montserrat(
                             fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                          ),),
                       SizedBox(height: 25.h,),
                       checkCategoryButton(),
                       SizedBox(height: 30.h,),
                       Text("Brand",style: GoogleFonts.montserrat(
                         fontSize: 24.sp,
                         fontWeight: FontWeight.w600,
                       ),),
                       SizedBox(height: 25.h,),
                       checkBrandButton(),
                       SizedBox(height: 30.h,),
                       PrimaryButton(
                         text: "Apply Filter",
                         onClick: (){},
                       )
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }

  Widget checkCategoryButton() {

    return Container(
      height: 230.h,
      child: Column(
        children: [
          Row(
            children: [
            Checkbox(
            checkColor: Colors.white,
            activeColor: nPrimaryColor,
            tristate: false,
            value: valueEgg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.r)
            ),
            onChanged: (bool? value) {
              setState(() {
                valueEgg = value!;
              });
            },
           ),
              Text("Eggs",style: GoogleFonts.montserrat(
                color: valueEgg ? nPrimaryColor : nBlackTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp
              ),)
          ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value: valuePasta,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valuePasta = value!;
                  });
                },
              ),
              Text("Noodles & Pasta",style: GoogleFonts.montserrat(
                  color: valuePasta ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value: valueChips,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueChips = value!;
                  });
                },
              ),
              Text("Chips & Crisps",style: GoogleFonts.montserrat(
                  color: valueChips ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value: valueFastFood,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueFastFood = value!;
                  });
                },
              ),
              Text("Fast Food",style: GoogleFonts.montserrat(
                  color: valueFastFood ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
        ],
      ) ,
    );
  }
  Widget checkBrandButton() {

    return Container(
      height: 230.h,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                tristate: false,
                value: valuePepsi,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    valuePepsi = value!;
                  });
                },
              ),
              Text("Pepsi",style: GoogleFonts.montserrat(
                  color: valuePepsi ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)
            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value: valueCoke,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueCoke = value!;
                  });
                },
              ),
              Text("Coca Cola",style: GoogleFonts.montserrat(
                  color: valueCoke ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value : valueIndomie,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueIndomie = value!;
                  });
                },
              ),
              Text("Indomie",style: GoogleFonts.montserrat(
                  color: valueIndomie ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: nPrimaryColor,
                value: valueGino,
                tristate: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r)
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.valueGino= value!;
                  });
                },
              ),
              Text("Gino",style: GoogleFonts.montserrat(
                  color: valueGino ? nPrimaryColor : nBlackTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),)

            ],
          ),
        ],
      ) ,
    );
  }

}