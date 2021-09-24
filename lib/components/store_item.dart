import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/app_strings.dart';
import 'package:nectar/config/palette.dart';
import 'package:get/get.dart';
import 'package:nectar/features/store/controller/store_controller.dart';
import 'package:nectar/routes/app_routes.dart';

class StoreItem extends StatelessWidget {
  String imageLink;
  String itemName;
  int itemWeight;
  int itemAmount;
  double itemPrice;
  int id;
  int index;

  StoreItem(
      {required this.imageLink,
      required this.itemName,
      required this.itemWeight,
      required this.itemAmount,
      required this.itemPrice,
      required this.id,
      required this.index});

  final _controller = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.GROCERY_DETAILS,
              arguments: {_controller.grocery[index].id});
        },
        child: Container(
          width: 173.w,
          height: 270.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                color: nLineColor,
                width: 1.w,
              )),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset('assets/icons/bookmark.svg'),
                  ),
                ),
                Center(
                    child: Expanded(
                        child: Image.asset(imageLink,
                  width: 99.w,
                  height: 79.h,
                ))),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  itemName,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: nBlackTextColor,
                  ),
                ),
                Text(
                  "$itemAmount pieces,",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: nGreyTextColor,
                  ),
                ),
                Text(
                  "$itemWeight kg",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: nGreyTextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$symbolN$itemPrice",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: nBlackTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: favButton(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget favButton() {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: nPrimaryColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Icon(
        Icons.add_outlined,
        color: Colors.white,
      ),
    );
  }
}
