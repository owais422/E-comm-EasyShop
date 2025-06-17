import 'package:ecommerce_app/controllers/email_sign_up_controller.dart';
import 'package:ecommerce_app/controllers/forget_password_controller.dart';
import 'package:ecommerce_app/screens/auth_ui/signin_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final EmailSignUpController emailSignUpController = Get.put(
    EmailSignUpController(),
  );

  TextEditingController userEmail = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        backgroundColor: AppConstant.appSecondaryColor,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                "Welcome to my app",
                style: TextStyle(
                  color: AppConstant.appSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: userEmail,
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
            // SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: userName,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "User Name",
                    prefixIcon: Icon(Icons.person),
                    contentPadding: EdgeInsets.only(top: 2, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            //          SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: userPhone,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(Icons.phone),
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
                child: TextField(
                  controller: userCity,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "City",
                    prefixIcon: Icon(Icons.location_city),
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
                child: Obx(() {
                  return TextField(
                    obscureText: emailSignUpController.isPasswordVisible.value,
                    controller: userPassword,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          emailSignUpController.isPasswordVisible.toggle();
                        },
                        child:
                            emailSignUpController.isPasswordVisible.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                      ),
                      contentPadding: EdgeInsets.only(top: 2, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: Get.height / 25),
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
                  onPressed: ()async {
                    String email = userEmail.text.trim();
                    String name = userName.text.trim();
                    String phone = userPhone.text.trim();
                    String city = userCity.text.trim();
                    String password = userPassword.text.trim();
                    if (email.isEmpty ||
                        name.isEmpty ||
                        city.isEmpty ||
                        password.isEmpty ||
                        phone.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please Fill all the desired field",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor,
                      );
                    }else{
                      UserCredential? userCredential = await emailSignUpController.SignUpMethod(name, email, phone, city, password, "");
                    if(userCredential!= null){
                      Get.snackbar(
                        "Verification email sent ",
                        "Please check your email",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor,
                      );
                      FirebaseAuth.instance.signOut();
                      Get.offAll(()=> SignInScreen());
                    }


                    }

                  },
                  label: Text(
                    "Sign Up",
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
                  "Already have an account? ",
                  style: TextStyle(color: AppConstant.appSecondaryColor),
                ),
                InkWell(
                  onTap: () {


                    Get.offAll(SignInScreen());
                  },
                  child: Text(
                    "Sign In",
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
