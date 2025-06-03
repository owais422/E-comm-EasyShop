import 'package:ecommerce_app/screens/auth_ui/signin_screen.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up",style: TextStyle(color: AppConstant.appTextColor),),
        backgroundColor: AppConstant.appSecondaryColor,
      ),

      body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Column(
          children: [
         Container(margin:EdgeInsets.symmetric(vertical: 30,horizontal: 20)
             ,child: Text("Welcome to my app",
         style: TextStyle(color: AppConstant.appSecondaryColor,fontWeight: FontWeight.bold,fontSize: 16),
             )),
        
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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
            )
            ,
        //          SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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
                child: TextField(
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: EdgeInsets.only(top: 2, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
        
            SizedBox(height: Get.height/25,),
            Material(
              child: Container(
                width: Get.width*0.8,
                height: Get.height/18,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 2),
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
        
                  onPressed: () {},
                  label: Text(
                    "Sign Up",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "Already have an account? ",
                style: TextStyle(color: AppConstant.appSecondaryColor),
              ),InkWell(
                onTap: (){Get.offAll(SignInScreen());},
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 16,color: AppConstant.appSecondaryColor,fontWeight: FontWeight.bold),
                ),
              ),],
            )
          ],
        ),
      ),
    );
  }
}
