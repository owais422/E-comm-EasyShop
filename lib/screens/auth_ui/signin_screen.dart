import 'package:ecommerce_app/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/screens/auth_ui/forgot_password_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/signup_screen.dart';
import 'package:ecommerce_app/screens/user_panel/main_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = Get.put(SignInController());
  final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isShrink = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                  () => TextField(
                    controller: _passwordController,
                    obscureText: _signInController.isPasswordVisible.value,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _signInController.isPasswordVisible.toggle();
                        },
                        child:
                            _signInController.isPasswordVisible.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                      ),
                      contentPadding: EdgeInsets.only(top: 2, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (){
                  Get.to(()=>ForgotPasswordScreen());
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: AppConstant.appSecondaryColor,
                    fontWeight: FontWeight.bold,
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
                    String password = _passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please fill all the desired field",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor,
                      );
                    } else {
                      UserCredential? userCredential =
                          await _signInController.SignInMethod(email, password);
                      if (userCredential != null) {
                        if (userCredential.user!.emailVerified) {
                          Get.snackbar(
                            "Success",
                            "Login Successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                          Get.offAll(()=> MainScreen());
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please verify your email before login",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }else{
                        Get.snackbar(
                          "Error",
                          "Please try again",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      }
                    }
                  },
                  label: Text(
                    "Sign In",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppConstant.appSecondaryColor),
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(SignUpScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConstant.appSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
