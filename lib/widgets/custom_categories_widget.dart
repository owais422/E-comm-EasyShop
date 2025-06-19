import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../models/categories_model.dart';

class CustomCategoriesWidget extends StatelessWidget {
  const CustomCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("categories").get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Categories Available"));
        }
        if (snapshot.data != null) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: 180,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                CategoriesModel categoriesModel = CategoriesModel(
                  categoryId: snapshot.data!.docs[index]["categoryId"],
                  categoryImg: snapshot.data!.docs[index]["categoryImg"],
                  categoryName: snapshot.data!.docs[index]["categoryName"],
                  createdAt: snapshot.data!.docs[index]["createdAt"],
                  updatedAt: snapshot.data!.docs[index]["updatedAt"],
                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FillImageCard(

                        borderRadius: 5,
                        width: Get.width / 2,
                        heightImage: Get.height * 0.1,
                        imageProvider: CachedNetworkImageProvider(
                          categoriesModel.categoryImg,
                        ),
                        title: Text(
                          categoriesModel.categoryName,
                          style: TextStyle(fontSize: 20),
                        ),
                        //description: Text("data"),

                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
