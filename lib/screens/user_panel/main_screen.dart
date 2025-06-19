import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:ecommerce_app/widgets/custom_categories_widget.dart';
import 'package:ecommerce_app/widgets/custom_drawer_widget.dart';
import 'package:ecommerce_app/widgets/custom_heading_widget.dart';
import 'package:ecommerce_app/widgets/custom_slider_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_card/image_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        backgroundColor: AppConstant.appPrimaryColor,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height / 90),
              CustomSliderWidget(),
              CustomHeadingWidget(
                buttonText: "See more >",
                headingSubTitle: "low Budget",
                headingTitle: "Categories",
                onPress: () {},
              ),
CustomCategoriesWidget(),CustomHeadingWidget(
                buttonText: "See more >",
                headingSubTitle: "low Budget",
                headingTitle: "Flash Sale",
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
