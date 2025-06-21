import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:ecommerce_app/widgets/custom_categories_widget.dart';
import 'package:ecommerce_app/widgets/custom_drawer_widget.dart';
import 'package:ecommerce_app/widgets/custom_flash_sale_widget.dart';
import 'package:ecommerce_app/widgets/custom_heading_widget.dart';
import 'package:ecommerce_app/widgets/custom_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              CustomFlashSaleWidget()
            ],
          ),
        ),
      ),
    );
  }
}
