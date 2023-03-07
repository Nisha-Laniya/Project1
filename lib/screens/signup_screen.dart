import 'package:assignment3/resources/color_manager.dart';
import 'package:assignment3/screens/shoppinglistscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/reusable_widgets.dart';


class SignUpScreen extends StatefulWidget {
  static const id = 'signupscreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorManager.darkGreen,ColorManager.lightGreen],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 120, right: 20).r,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  reusableTextField('Enter UserName', Icons.person_outline,
                      false, _usernameTextController, "username",TextInputAction.next),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableTextField('Enter Email', Icons.email_outlined, false,
                      _emailTextController, "email",TextInputAction.next),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableTextField('Enter Password', Icons.lock_outline, true,
                      _passwordTextController, "password",TextInputAction.next),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableTextField(
                      'Enter Confirm Password',
                      Icons.lock_outline,
                      true,
                      _confirmPasswordTextController,
                      "confirm password",TextInputAction.done),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableButton(context, "SIGN UP", () {
                    if (_formKey.currentState!.validate()){
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print('Account created successfully');
                        final auth = FirebaseAuth.instance.currentUser;
                        auth!.updateDisplayName(_usernameTextController.text);
                        FirebaseFirestore.instance.collection('Users').doc(value.user!.email).set({'Email': auth.email,'Uid':auth.uid});
                        Navigator.pushNamedAndRemoveUntil(
                            context, ShoppingList.id, (route) => true);
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
