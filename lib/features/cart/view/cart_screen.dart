import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/cart/components/body.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: Body(),
     appBar: AppBar(
       title: Center(child: Text("Cart", style: GoogleFonts.montserrat(
         color: nBlackTextColor
       ),)),
       backgroundColor: Colors.white,
       automaticallyImplyLeading: false,
     ),
   );
  }

}