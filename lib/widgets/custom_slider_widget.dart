import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/carousel_controller.dart';

class CustomSliderWidget extends StatelessWidget {
  CustomSliderWidget({super.key});
  final CarouselController carouselController = CarouselController();
  final BannerController bannerController = Get.put(BannerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Obx(() {
        return CarouselSlider(
          items:
              bannerController.bannerUrls.map((imageUrls) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: CachedNetworkImage(
                    imageUrl: imageUrls,
                    fit: BoxFit.cover,
                    width: Get.width - 10,
                    placeholder:
                        (context, url) => ColoredBox(
                          color: Colors.red,
                          child: CircularProgressIndicator(),
                        ),

                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            aspectRatio: 2,
            viewportFraction: 1,
          ),
        );
      }),
    );
  }
}
