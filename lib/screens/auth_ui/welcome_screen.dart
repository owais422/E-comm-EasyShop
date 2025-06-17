import 'package:ecommerce_app/screens/auth_ui/signin_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/signup_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
 final  GoogleSignInController googleSignInController = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppConstant.appSecondaryColor,
        title: Text("Welcome to my App", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height*0.5,
              decoration: BoxDecoration(color: AppConstant.appSecondaryColor),
              child: Lottie.asset("assets/images/splashScreen.json"),
            ),
            SizedBox(height: Get.height/20,),
            Text(
              "Happy Shopping",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppConstant.appSecondaryColor),
            ),
            SizedBox(height: Get.height/22,),
            Material(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  icon: Image.asset(
                    "assets/images/google_icon.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    googleSignInController.signInWithGoogle();
                  },
                  label: Text(
                    "Sign in with Google",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height/30,),
            Material(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  icon: Icon(Icons.email, size: 30, color: Colors.white),
                  onPressed: () {
                    Get.to(()=> SignUpScreen());
                  },
                  label: Text(
                    "Sign in with E-mail",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
