import 'package:ecommerce_app/controllers/forget_password_controller.dart';
import 'package:ecommerce_app/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/screens/auth_ui/signin_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/signup_screen.dart';
import 'package:ecommerce_app/screens/user_panel/main_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isShrink = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        backgroundColor: AppConstant.appSecondaryColor,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.4,
                  color: AppConstant.appSecondaryColor,
                  child: Lottie.asset("assets/images/splashScreen.json"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailController,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(top: 2, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Material(
              child: Container(
                width: Get.width * 0.8,
                height: Get.height / 18,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 2),
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  onPressed: () async {
                    String email = _emailController.text.trim();

                    if (email.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please fill all the desired field",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor,
                      );
                    } else{
forgotPasswordController.ForgotPasswordMethod(email);
Get.offAll(()=>SignInScreen());
                    }
                  },
                  label: Text(
                    "Forgot Password",
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
