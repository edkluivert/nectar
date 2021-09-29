import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar/components/Keyboard.dart';
import 'package:nectar/components/primary_button.dart';
import 'package:nectar/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/features/login/controller/login_controller.dart';
import 'package:nectar/routes/app_routes.dart';

class LoginForm extends StatefulWidget{

  @override
  _LoginForm createState()=> _LoginForm();
}

class _LoginForm extends State<LoginForm>{


  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  bool _autoValidate = false;
  final _controller = Get.find<LoginController>();


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
              SizedBox(height: 30.h,),
              buildPasswordField(),
              SizedBox(height: 20.h,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.FORGOT_PASSWORD);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Forgot',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: nGreyTextColor,
                          fontWeight: FontWeight.w500
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ' Password?', style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            color: nGreyTextColor,
                            fontWeight: FontWeight.w500
                        ),),
                        // TextSpan(text: ''),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              PrimaryButton(text: "Log In",
                  onClick: (){
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   // if all are valid then go to success screen
                    //   KeyboardUtil.hideKeyboard(context);
                    //
                    //
                    // }else{
                    //   Get.snackbar(
                    //     "Default SnackBar",
                    //     "This is the Getx default SnackBar",
                    //   );
                    // }
                    Get.toNamed(AppRoutes.LOCATION);


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

  Widget buildPasswordField() {
    return Obx(
          () =>TextFormField(
        obscureText: _controller.hideText.isTrue,
        keyboardType: TextInputType.text,
        style: GoogleFonts.montserrat(color: nTextFieldColor, fontWeight: FontWeight.w500,
            fontSize: 18.sp
        ),
        controller: _controller.passwordController,
        onSaved: (value) {
          _controller.password = value!;
        },
        validator: (value) {
          return _controller.validatePassword(value!);
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _controller.hideText.isFalse ? Icons.visibility : Icons.visibility_off,
              color: nGreyTextColor,
            ), onPressed: () {
            _controller.toggle();
          },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: nLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: nLineColor),

          ),
          labelText: "Password",
          labelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              color: nGreyTextColor
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );

  }
}