
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/store_item.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/product_list/controller/productlist_controller.dart';
import 'package:nectar/routes/app_routes.dart';

class Body extends StatefulWidget {

 @override
  _Body createState()=> _Body();

}
class _Body extends State<Body>{
  final _controller = Get.find<ProductListController>();
  var data = Get.arguments;


  int selectedIndex = 0;


  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

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
                          onTap: () {
                            Get.toNamed(AppRoutes.FILTER);
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
