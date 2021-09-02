import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final String errorText;
  final List<String> items;
  final Function onChanged;

  const CustomDropDown(
      {Key? key,
      required this.value,
      required this.items,
      required this.onChanged,
      required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
            child: DropdownButton<String>(
              value: value,
              style: GoogleFonts.montserrat(
                  color: nBlackTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (item) {
                onChanged(item);
              },
              isExpanded: true,
              underline: Container(

              ),
              icon: SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                height: 10.h,
                width: 7.w,
              ),
            ),
          ),
        ),
        if (errorText.isEmpty)
          Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(errorText, style: TextStyle(fontSize: 12, color: Colors.red[800]),),
          )

      ],
    );
  }
}
