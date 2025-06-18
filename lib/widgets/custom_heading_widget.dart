import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class CustomHeadingWidget extends StatelessWidget {
  const CustomHeadingWidget({
    super.key,
    required this.buttonText,
    required this.headingSubTitle,
    required this.headingTitle,
    required this.onPress,
  });
  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  headingSubTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: onPress,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppConstant.appSecondaryColor,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppConstant.appSecondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
