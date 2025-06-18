import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app_constant.dart';
import '../auth_ui/welcome_screen.dart';
class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: [
        IconButton(
          onPressed: () async{
            GoogleSignIn googleSignIn = GoogleSignIn();
            FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
            await    googleSignIn.signOut();
            await _firebaseAuth.signOut();
            Get.offAll(() => WelcomeScreen());
          },
          icon: Icon(Icons.logout),
        ),
      ],
      title: Text("Admin Panel"),
      centerTitle: true,
      backgroundColor: AppConstant.appPrimaryColor,
    ),);
  }
}
