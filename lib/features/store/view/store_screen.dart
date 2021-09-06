import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar/features/store/components/body.dart';

class StoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }

}