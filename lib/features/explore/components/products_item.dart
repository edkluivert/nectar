import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/product_list/controller/productlist_controller.dart';
import 'package:nectar/routes/app_routes.dart';

class ProductItem extends StatelessWidget{

  int productColor;
  String productName;
  int productBorderColor;
  String productImage;
  int index;

  ProductItem({
   required this.productColor,
   required this.productBorderColor,
    required this.productImage,
    required this.productName,
    required this.index
});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ProductListController>();
     return Material(
       child: InkWell(
         onTap: () {
           Get.toNamed(AppRoutes.PRODUCT_LIST, arguments: {productName
           });
         },
         child: Container(
           width: 174.w,
           height: 189.h,
           decoration: BoxDecoration(
           color: Color(productColor).withOpacity(0.30),
             borderRadius: BorderRadius.circular(18.r),
             border: Border.all(
               color: Color(productBorderColor).withOpacity(0.70)
             )
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(productImage,width: 111.w,height: 90.h,),
               SizedBox(height: 41.h,),
               Text(productName, style: GoogleFonts.montserrat(
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w700,
                   color: nBlackTextColor,),
               textAlign: TextAlign.center,
               ),
             ],
           ),
         ),
       ),
     );
  }

}