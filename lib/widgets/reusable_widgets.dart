import 'package:assignment3/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget title(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color:ColorManager.white
    ),
  );
}


TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller,String label,TextInputAction textInputAction) {
  return TextFormField(
    textInputAction: textInputAction,
      controller: controller,
      obscureText: isPasswordType,
      cursorColor: ColorManager.white,
      style: TextStyle(color: ColorManager.white.withOpacity(0.9)),
      validator: (value) {
        if (label == "password"||label=="confirm password") {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          } else if (value.length < 8) {
            return 'Please enter more than 8 characters';
          }
        }
        else if (label == "email") {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}')
              .hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }
        else{
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          }
        }
        return null;
      },
      decoration:
      InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        errorStyle: TextStyle(
            fontSize: 12.sp,
            color: ColorManager.red),
        hintText: text,
        hintStyle: TextStyle(color: ColorManager.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: ColorManager.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25).w,
            borderSide: BorderSide(width: 0.w, style: BorderStyle.none)),
      )
  );
}



Container reusableButton(
    BuildContext context,String text, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 45.h,
    margin: const EdgeInsets.only(top: 10,bottom: 20).r,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.white,
          foregroundColor: ColorManager.black2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30).w)
      ),
      child: Text(
        text,
        style:TextStyle(
          color: ColorManager.black2,
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
        ),
      ),
    ),
  );
}