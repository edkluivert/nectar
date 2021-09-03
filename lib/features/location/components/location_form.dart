import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/components/Keyboard.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/core/model/localization_model.dart';
import 'package:nectar/features/location/controller/location_controller.dart';
import 'package:nectar/routes/app_routes.dart';

class LocationForm extends StatefulWidget{
  @override
  _LocationForm createState()=> _LocationForm();
}
class _LocationForm extends State<LocationForm>{

  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  bool _autoValidate = false;
  final _controller = Get.find<LocationController>();

  List statesList = [];
  List localsList = [];
  List tempList = [];
  String? _state;
  String? _local;

  String defaultState = "Select a state";

  Future<String> loadStatesProvincesFromFile() async {
    return await rootBundle.loadString('json/states.json');
  }

  Future<String?> _populateDropdown() async {
    String getPlaces = await loadStatesProvincesFromFile();
    final jsonResponse = json.decode(getPlaces);

    Localization places = new Localization.fromJson(jsonResponse);

    setState(() {
      statesList = places.states;
      localsList = places.locals;
    });
  }

  @override
  void initState() {
    super.initState();
    this._populateDropdown();
  }

  Widget build(BuildContext context) {
   return Form(
       key: _formKey,
       onChanged: () =>
           setState(() => _btnEnabled = _formKey.currentState!.validate()),
       autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
       child: Column(
     children: [
       Padding(
         padding: EdgeInsets.only(left: 24.w, right: 25.w),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Your Zone",
               style: GoogleFonts.montserrat(
                   color: nGreyTextColor,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600
               ),
             ),
             // SizedBox(height: 10.h,),
             Container(
               width: 364.w,
               //height: 40,
               decoration: BoxDecoration(
                 //color: Colors.grey[100],
                   border: Border(
                       bottom: BorderSide(
                           color: nLineColor
                       )
                   )
               ),
               child: Padding(
                 padding: EdgeInsets.only(
                     top: 10.h, bottom: 5.h),
                 child: DropdownButtonFormField<String>(
                   style: GoogleFonts.montserrat(
                       color: nBlackTextColor,
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w600),
                   items:statesList.map((item) {
                     return new DropdownMenuItem(
                       child: new Text(item.name),
                       value: item.id.toString(),
                     );
                   }).toList(),
                   onChanged: (item) {
                     setState(() {
                       _local = null;
                       _state = item;
                       tempList = localsList
                           .where((x) =>
                       x.stateId.toString() == (_state.toString()))
                           .toList();
                     });
                   },
                   isExpanded: true,
                   validator:(value) => value == null
                       ? 'Please provide state': null,
                   decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide.none
                   )
                   ),
                   icon: SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                     height: 10.h,
                     width: 7.w,
                   ),
                   value: _state,

                   hint: Text('Select a state',style: GoogleFonts.montserrat(
                       color : nGreyTextColor,
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w600
                   ),),
                 ),
               ),
             ),
             SizedBox(height: 30.h,),
             Text("Your Area",
               style: GoogleFonts.montserrat(
                   color: nGreyTextColor,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600
               ),
             ),
             //SizedBox(height: 10.h,),
             Container(
               width: 364.w,
               //height: 40,
               decoration: BoxDecoration(
                 //color: Colors.grey[100],
                   border: Border(
                       bottom: BorderSide(
                           color: nLineColor
                       )
                   )
               ),
               child: Padding(
                 padding: EdgeInsets.only(
                     top: 10.h, bottom: 5.h),
                 child: DropdownButtonFormField<String>(

                   style: GoogleFonts.montserrat(
                       color: nBlackTextColor,
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w600),
                   items:tempList.map((item) {
                     return new DropdownMenuItem(
                       child: new Text(item.name),
                       value: item.id.toString(),
                     );
                   }).toList(),
                   onChanged: (item) {
                     setState(() {
                       _local = item;
                     });
                   },
                   isExpanded: true,
                   decoration: InputDecoration(
                       enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide.none
                       )
                   ),
                   icon: SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                     height: 10.h,
                     width: 7.w,
                   ),
                   validator: (value) => value == null
                       ? 'Please provide local government': null,
                   value: _local,
                   hint: Text('Select local government', style: GoogleFonts.montserrat(
                     color : nGreyTextColor,
                     fontSize: 16.sp,
                     fontWeight: FontWeight.w600
                   ),),
                 ),
               ),
             ),
             SizedBox(height: 20.h,),
             Text("Street",
               style: GoogleFonts.montserrat(
                   color: nGreyTextColor,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600
               ),
             ),
             SizedBox(
               width: 364.w,
               // height: 40.h,
               child: TextFormField(
                 keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                   hintText: 'Enter street name',
                   hintStyle: GoogleFonts.montserrat(color: nGreyTextColor,
                       fontWeight: FontWeight.w600,
                       fontSize: 16.sp
                   ),
                   //labelText: 'Street',
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: nLineColor),
                   ),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: nLineColor),

                   ),
                 ),
                 // controller: _controller.emailController,
                 onSaved: (value) {
                   // _controller.email = value!;
                 },
                 validator: (value) {
                   return _controller.validateStreet(value!);
                 },
                 style: GoogleFonts.montserrat(color: nBlackTextColor,
                     fontWeight: FontWeight.w600,
                     fontSize: 16.sp
                 ),
               ),
             ),
             SizedBox(height: 60.h,),
             PrimaryButton(text: "Submit",
                 onClick: (){
                   // if (_formKey.currentState!.validate()) {
                   //   _formKey.currentState!.save();
                   //   // if all are valid then go to success screen
                   //   KeyboardUtil.hideKeyboard(context);
                   //
                   // }else{
                   //   Get.snackbar(
                   //     "Default SnackBar",
                   //     "This is the Getx default SnackBar",
                   //   );
                   // }


                 }
             ),
             SizedBox(height: 50.h,),
           ],
         ),
       ),
     ],
   ));
  }

}

