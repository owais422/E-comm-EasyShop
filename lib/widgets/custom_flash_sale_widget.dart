import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:ecommerce_app/models/productsModel.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_card/image_card.dart";
import "../models/categories_model.dart";

class CustomFlashSaleWidget extends StatelessWidget {
  const CustomFlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products").where("isSale",isEqualTo: true).get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Products Available"));
        }
        if (snapshot.data != null) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: Get.height*0.25,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ProductsModel productsModel = ProductsModel(
                  updatedAt:snapshot.data!.docs[index]["updatedAt"] ,
                  fullPrice: snapshot.data!.docs[index]["fullPrice"],
                  productDescription: snapshot.data!.docs[index]["productDescription"],
                  categoryId: snapshot.data!.docs[index]["categoryId"],
                  productImages: snapshot.data!.docs[index]["productImages"],
                  categoryName: snapshot.data!.docs[index]["categoryName"],
                  createdAt: snapshot.data!.docs[index]["createdAt"],
                   deliveryTime: snapshot.data!.docs[index]["deliveryTime"],
                  isSale: snapshot.data!.docs[index]["isSale"],
                    productId: snapshot.data!.docs[index]["productId"],
                    productName: snapshot.data!.docs[index]["productName"],
                    price: snapshot.data!.docs[index]["price"]

                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FillImageCard(
                        borderRadius: 5,
                        width: Get.width / 2,
                        heightImage: Get.height * 0.13,
                        imageProvider: CachedNetworkImageProvider(
                          productsModel.productImages[0],
                        ),
                        title: Text(
                          productsModel.productName,
                          style: TextStyle(fontSize: 18,overflow: TextOverflow.ellipsis),
                        ),
                        //description: Text("data"),
                        footer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Rs ${productsModel.price} (Sale)",style: TextStyle(fontWeight: FontWeight.bold),),Text("Rs ${productsModel.fullPrice}",style: TextStyle(decoration:TextDecoration.lineThrough,color: Colors.red),)],),

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
