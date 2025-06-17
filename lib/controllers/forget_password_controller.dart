import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class ForgotPasswordController extends GetxController{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
Future<void> ForgotPasswordMethod (String userEmail)async{
  try{
    EasyLoading.show(status: "Please wait..");
    await   _firebaseAuth.sendPasswordResetEmail(email: userEmail);

 Get.snackbar(

   "Request sent successfully",
   "Password reset link sent to $userEmail",
   snackPosition: SnackPosition.BOTTOM,
   backgroundColor: AppConstant.appSecondaryColor,
   colorText: AppConstant.appTextColor,
 );

  }catch(e){
    EasyLoading.dismiss();
    Get.snackbar(
      "Error",
      "$e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstant.appSecondaryColor,
      colorText: AppConstant.appTextColor,
    );
  }

}

}