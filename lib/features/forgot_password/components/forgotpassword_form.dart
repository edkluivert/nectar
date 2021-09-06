import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/Keyboard.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:nectar/features/forgot_password/controller/forgotpassword_controller.dart';

class ForgotPasswordForm extends StatefulWidget{

  @override
  _ForgotPasswordForm createState()=> _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<ForgotPasswordForm>{


  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  bool _autoValidate = false;
  final _controller = Get.find<ForgotPasswordController>();


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        onChanged: () =>
            setState(() => _formKey.currentState!.validate()),
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEmailField(),
              SizedBox(height: 50.h,),
              PrimaryButton(text: "Reset",
                  onClick: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen
                      KeyboardUtil.hideKeyboard(context);

                    }else{
                      Get.snackbar(
                        "Default SnackBar",
                        "This is the Getx default SnackBar",
                      );
                    }


                  }
              ),
            ]
        ));
  }


  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.montserrat(color: nTextFieldColor,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp
      ),
      controller: _controller.emailController,
      onSaved: (value) {
        _controller.email = value!;
      },
      validator: (value) {
        return _controller.validateEmail(value!);
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: nLineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: nLineColor),

        ),
        labelText: "Email",
        labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: nGreyTextColor
        ),

        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }


  }
