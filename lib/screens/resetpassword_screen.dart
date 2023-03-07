import 'package:assignment3/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../widgets/reusable_widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const id="resetpasswordscreen";
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:Text(
            'Reset Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorManager.lightGreen,
                ColorManager.green
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 120,right: 20).r,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    reusableTextField('Enter Email', Icons.email_outlined,
                        false, _emailTextController, "email",TextInputAction.done),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusableButton(context, "Reset Password", () {
                      if(_formKey.currentState!.validate()) {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text).then((value) {
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                        });
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}