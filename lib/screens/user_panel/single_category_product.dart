import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/productsModel.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';
import '../../models/categories_model.dart';

class SingleCategoryProduct extends StatelessWidget {
  const SingleCategoryProduct({super.key , required this.categoryId});
final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("",style: TextStyle(color: AppConstant.appTextColor),),
        backgroundColor: AppConstant.appPrimaryColor,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("products").where("categoryId", isEqualTo: categoryId).get(),
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
                ProductsModel categoriesModel = ProductsModel(
                  productDescription:snapshot.data!.docs[index]["productDescription"] ,
                  fullPrice: snapshot.data!.docs[index]["fullPrice"],
                  deliveryTime: snapshot.data!.docs[index]["deliveryTime"],
                  isSale: snapshot.data!.docs[index]["isSale"],
                   price: snapshot.data!.docs[index]["price"] ,
                  productId: snapshot.data!.docs[index]["productId"] ,
                  productImages: snapshot.data!.docs[index]["productImages"],
                  productName: snapshot.data!.docs[index]["productName"],
                  categoryId: snapshot.data!.docs[index]["categoryId"],
                  categoryName: snapshot.data!.docs[index]["categoryName"],
                  createdAt: snapshot.data!.docs[index]["createdAt"],
                  updatedAt: snapshot.data!.docs[index]["updatedAt"],
                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FillImageCard(
                        borderRadius: 10,
                        width: Get.width / 2.5,
                        heightImage: Get.height * 0.1,
                        imageProvider: CachedNetworkImageProvider(
                          categoriesModel.productImages[0],
                        ),
                        title: Text(
                          categoriesModel.productName,
                          style: TextStyle(fontSize: 18,),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );

          }
          return Container();
        },
      ),
    );
  }
}
