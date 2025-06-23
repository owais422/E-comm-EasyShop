import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/screens/user_panel/single_category_product.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';
import '../../models/categories_model.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories",style: TextStyle(color: AppConstant.appTextColor),),
        backgroundColor: AppConstant.appPrimaryColor,
      ),
      body: FutureBuilder(
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
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
              //  mainAxisExtent: 3,
            //    childAspectRatio: 1.19,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                CategoriesModel categoriesModel = CategoriesModel(
                  categoryId: snapshot.data!.docs[index]["categoryId"],
                  categoryImg: snapshot.data!.docs[index]["categoryImg"],
                  categoryName: snapshot.data!.docs[index]["categoryName"],
                  createdAt: snapshot.data!.docs[index]["createdAt"],
                  updatedAt: snapshot.data!.docs[index]["updatedAt"],
                );
                return GestureDetector(
                  onTap: (){
                    Get.to(()=> SingleCategoryProduct(categoryId: categoriesModel.categoryId,));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        FillImageCard(
                          borderRadius: 10,
                          width: Get.width / 2.5,
                          heightImage: Get.height * 0.1,
                          imageProvider: CachedNetworkImageProvider(
                            categoriesModel.categoryImg,
                          ),
                          title: Text(
                            categoriesModel.categoryName,
                            style: TextStyle(fontSize: 18,),
                          ),
                  ),
                      ],
                    ),
                  ),
                );
              },
            );

            //   Container(
            //   margin: EdgeInsets.symmetric(horizontal: 2),
            //   width: Get.width,
            //   height: Get.height,
            //   child: ListView.builder(
            //     itemCount: snapshot.data!.docs.length,
            //     scrollDirection: Axis.vertical,
            //
            //   ),
            // );
          }
          return Container();
        },
      ),
    );
  }
}
