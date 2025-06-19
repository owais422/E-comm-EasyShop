import 'dart:async';
import 'package:ecommerce_app/controllers/user_data_controller.dart';
import 'package:ecommerce_app/screens/admin_panel/admin_main_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:ecommerce_app/screens/user_panel/main_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        adminOrUser();
      });
  }
  Future<void> adminOrUser ()async{

    if(user!= null){
      final UserDataController userDataController = Get.put(UserDataController());
      var userData = await userDataController.getUserData(user!.uid);
      if(userData[0]["isAdmin"]==true){
        Get.offAll(()=>AdminMainScreen());
      }else{
        Get.offAll(()=>MainScreen());
      }
    }else{
      Get.offAll(WelcomeScreen());
    }
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
