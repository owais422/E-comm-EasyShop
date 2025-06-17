//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../utils/app_constant.dart';

class SignInController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final fireStore = FirebaseFirestore.instance;

  //PasswordVisible
  var isPasswordVisible = true.obs;

  Future<UserCredential?> SignInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: "Please wait..");
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appSecondaryColor,
        colorText: AppConstant.appTextColor,
      );
    }
    return null;
  }
}
