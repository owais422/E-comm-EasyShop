import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/controllers/device_token_controller.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EmailSignUpController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  //PasswordVisible
  var isPasswordVisible = true.obs;

  Future<UserCredential?> SignUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {

    try {
      EasyLoading.show(status: "Please wait..");
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: userEmail,
          password: userPassword);

// Send Email Verification
     await  userCredential.user!.sendEmailVerification();
     UserModel userModel= UserModel(uId: userCredential.user!.uid,
         username: userName,
         email: userEmail,
         phone: userPhone,
         userImg: "",
         userDeviceToken: userDeviceToken,
         country: "",
         userAddress: userEmail,
         street: "",
         isAdmin: false,
         isActive: true,
         createdOn: DateTime.now(),
         city: userCity);

     // add data into database(FireBase)
      fireStore.collection("users").doc(userCredential.user!.uid).set(userModel.toMap());
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
  }
}
