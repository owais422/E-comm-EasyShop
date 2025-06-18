import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ecommerce_app/screens/auth_ui/signin_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/signup_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/splash_screen.dart';
import 'package:ecommerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:ecommerce_app/screens/testScreen.dart';
import 'package:ecommerce_app/screens/user_panel/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}
