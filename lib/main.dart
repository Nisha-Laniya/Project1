import 'package:assignment3/screens/login_screen.dart';
import 'package:assignment3/screens/product_details_screen.dart';
import 'package:assignment3/screens/shoppinglistscreen.dart';
import 'package:assignment3/screens/resetpassword_screen.dart';
import 'package:assignment3/screens/signup_screen.dart';
import 'package:assignment3/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            ProductDetailScreen.id: (context) => const ProductDetailScreen(),
            ResetPasswordScreen.id: (context) => const ResetPasswordScreen(),
            ShoppingList.id: (context) => const ShoppingList(),
            SignUpScreen.id: (context) => const SignUpScreen(),
          },
        );
      },
    );
  }
}
