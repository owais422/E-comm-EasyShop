import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/auth_ui/welcome_screen.dart';
import '../utils/app_constant.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        backgroundColor: AppConstant.appPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Owais",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                subtitle: Text(
                  "Lecturer In Mathematics",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppConstant.appSecondaryColor,
                  child: Text(
                    "O",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Home",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(Icons.home, color: AppConstant.appTextColor),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Product",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Order",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Contact",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(Icons.help, color: AppConstant.appTextColor),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                  await googleSignIn.signOut();
                  await firebaseAuth.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Logout",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(Icons.logout, color: AppConstant.appTextColor),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
