import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/nectar_icons.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/account/view/account_screen.dart';
import 'package:nectar/features/cart/view/cart_screen.dart';
import 'package:nectar/features/explore/view/explore_screen.dart';
import 'package:nectar/features/favourite/view/fav_screen.dart';
import 'package:nectar/features/home/controller/home_controller.dart';
import 'package:nectar/features/store/view/store_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                StoreScreen(),
                ExploreScreen(),
                CartScreen(),
                FavScreen(),
                AccountScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: nBlackTextColor,
            selectedItemColor: nPrimaryColor,
            onTap: controller.changeTabIndex,
            unselectedLabelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: nBlackTextColor
            ) ,
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: nPrimaryColor
            ),
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: Icon(Nectar.store),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/explore.svg',
                color: controller.tabIndex == 1 ? nPrimaryColor : nBlackTextColor,
                ),
                label: 'Explore',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Nectar.cart),
                label: 'Cart',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Nectar.favourite),
                label: 'Favourite',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Nectar.user),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );

  }
  _bottomNavigationBarItem({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,


    );
  }

}