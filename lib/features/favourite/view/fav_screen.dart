import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/favourite/components/body.dart';

class FavScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: Body(),
     appBar: AppBar(
       title: Center(child: Text("Favourite", style: GoogleFonts.montserrat(
           color: nBlackTextColor
       ),)),
       backgroundColor: Colors.white,
       automaticallyImplyLeading: false,
     ),
   );
  }

}