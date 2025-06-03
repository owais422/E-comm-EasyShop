import 'dart:async';

import 'package:ecommerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:ecommerce_app/screens/user_panel/main_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () => Get.off(SignUpScreen())
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: Get.width,
              height: Get.height*0.4,
              child: Lottie.asset("assets/images/splashScreen.json"),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 30,top: 30),
            child: Text(
              AppConstant.appPoweredBy,
              style: TextStyle(
                color: AppConstant.appTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
