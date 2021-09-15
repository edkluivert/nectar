
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/store_item.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/product_list/components/query_sheet.dart';
import 'package:nectar/features/product_list/controller/productlist_controller.dart';

class Body extends StatelessWidget {

  final _controller = Get.find<ProductListController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 51.w,
                    width: 320.w,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search Store',
                          contentPadding: EdgeInsets.all(10.0),
                          hintStyle: GoogleFonts.montserrat(
                              color: nGreyTextColor.withOpacity(0.30),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF181B19),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide.none),
                          fillColor: Color(0xFFF2F3F2),
                          filled: true),
                    ),
                  ),
                  Material(
                      child: InkWell(
                        onTap: (){
                          Get.bottomSheet(
                            Container(
                                height: 450.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35.r),
                                        topRight: Radius.circular(35.r))
                                ),
                                child:Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap:(){
                                                Get.back();
                                              },
                                              child: SvgPicture.asset('assets/icons/cancel.svg', width: 15.w,height: 15.h,)
                                          ),
                                          SizedBox(width: 130.w,),
                                          Text("Filters", style:  GoogleFonts.montserrat(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                              color: nBlackTextColor
                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            barrierColor: Colors.grey[60],
                            isDismissible: true,
                          );
                        },
                          child: SvgPicture.asset('assets/icons/query.svg', width: 25.w,
                          height: 25.h,
                          )
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.76,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return StoreItem(
                      itemName: _controller.grocery[index].name,
                      imageLink : _controller.grocery[index].img,
                      itemWeight: _controller.grocery[index].weight,
                      itemPrice : _controller.grocery[index].price, itemAmount: _controller.grocery[index].amount,
                      id: _controller.grocery[index].id,
                      index: index,);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
