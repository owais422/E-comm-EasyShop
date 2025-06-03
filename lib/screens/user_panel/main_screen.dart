import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        backgroundColor: AppConstant.appPrimaryColor,
      ),
    );
  }
}
