import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/product_list/components/body.dart';

class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Body(),
   );
  }

}